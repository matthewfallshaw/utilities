#!/usr/bin/env ruby

# Dir.cd(File.dirname($0))
# Dir.  … remove all files other than this one

switches = `wemo list`.split(/\n/).collect {|s| s[/Switch: (.*)/,1]}
switches.each do |switch|
  ["On", "Off"].each do |state|
    File.open("Wemo#{switch.gsub(/ /,'')}#{state}", "w") do |f|
      STDOUT.puts f.path
      f.puts <<END
#!/bin/bash
WEMOSWITCH="#{switch}"
SWITCHSTATE=#{state}
/usr/local/bin/wemo switch "$WEMOSWITCH" $SWITCHSTATE || /usr/local/bin/wemo clear && /usr/local/bin/wemo switch "$WEMOSWITCH" $SWITCHSTATE
END
      f.chmod(0777)
    end
  end
end
