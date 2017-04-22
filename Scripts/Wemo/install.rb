#!/usr/bin/env ruby

ROOMS = ["Office", "Alex"]

# Remove old scripts
Dir["Wemo*{On,Off}"].each {|f| File.delete(f) }

# Add any new switches to switches.txt
#  (we do this because switches sometimes temporarily fall off the network;
#   manually edit switches.txt to remove a switch you no longer have)
currently_detectable_switches = `wemo list`.split(/\n/).collect {|s| s[/Switch: (.*)/,1]}
File.open("switches.txt", "a") { |f| currently_detectable_switches.each { |switch| f.puts switch } }
system("sort -u switches.txt -o switches.txt")

# Switches
switches = File.readlines("switches.txt").collect(&:chomp)

# Create switch scripts
switches.each do |switch|
  ["On", "Off"].each do |state|
    File.open("Wemo#{switch.gsub(/ /,'')}#{state}", "w") do |f|
      STDOUT.puts f.path
      f.puts <<END
#!/bin/bash
WEMOSWITCH="#{switch}"
SWITCHSTATE=#{state}
/usr/local/bin/wemo switch "$WEMOSWITCH" $SWITCHSTATE || /usr/local/bin/wemo clear > /dev/null && /usr/local/bin/wemo switch "$WEMOSWITCH" $SWITCHSTATE
END
    end
  end
end

# Create room scripts
ROOMS.each do |room|
  ["On", "Off"].each do |state|
    File.open("Wemo#{room}#{state}", "w") do |f|
      f.puts "#!/bin/sh"
      switches.select {|s| s[/^#{room}/] }.each do |switch|
        f.puts "/usr/local/bin/wemo switch \"#{switch}\" #{state} &> /dev/null"
      end
      STDOUT.puts f.path
    end
  end
end

# Make scripts executable
Dir["Wemo*{On,Off}"].each {|f| File.chmod(0775, f) } # user, group: rwx, other: rx
