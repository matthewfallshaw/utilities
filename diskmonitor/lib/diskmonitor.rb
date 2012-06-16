#TODO: `diskutil verifyDisk $disk` and `diskutil verifyVolume $disk$volume`
#      for volumes 2+ of disks that are SMART 'Not Supported'

require 'net/smtp'

class DiskMonitor
  def self.drives
    list = `diskutil list | grep '^/dev/disk'`.chomp
    list.split.collect {|x| x[/(disk.+)/,1]}
  end

  def self.problematic_drives
    drives.select do |drive|
      !["Verified", "Not Supported"].include? status(drive)
    end
  end

  def self.status(disk)
    s = info(disk).split("\n").grep(/SMART Status:/).first
    s[/SMART Status:\s+(.+)/,1]
  end

  def self.info(disk)
    `diskutil info #{disk}`.chomp
  end

  def self.email_address
    `whoami`.chomp
  end
  def self.email_address=(e)
    def email_address; e; end
  end

  def self.mail_problematic_drives
    if problematic_drives.empty?
      puts "All drives okay."
    else
      puts "Problems with #{ problematic_drives.join(", ") }; mailing report to #{email_address}."
      send_email(email_address,
                 :subject => "#{`hostname`.chomp}: #{problematic_drives.join(",")} SMART status problematic",
                 :body => <<BODY
SMART status problematic with #{problematic_drives.size > 1 ? "drives #{problematic_drives.join(", ")}" : "drive #{problematic_drives.first}"}

#{problematic_drives.collect do |drive|
  "#{drive}: #{status(drive)}\n\n#{info(drive)}"
end.join("\n\n")}
BODY
                )
    end
  end

  def self.send_email(to, opts={})
    # kudos to http://blog.jerodsanto.net/2009/02/a-simple-ruby-method-to-send-emai/
    opts[:server]      ||= 'localhost'
    opts[:from]        ||= 'diskmonitor@localhost'
    opts[:from_alias]  ||= 'DiskMonitor'

    [:subject, :body].each do |opt|
      raise ArgumentError, "Missing option: #{opt}" unless opts[opt]
    end

    msg = <<END_OF_MESSAGE
From: #{opts[:from_alias]} <#{opts[:from]}>
To: <#{to}>
Subject: #{opts[:subject]}

#{opts[:body]}
END_OF_MESSAGE

    # Net::SMTP.start(opts[:server]) do |smtp|
    #   smtp.send_message msg, opts[:from], to
    # end
    system(<<SYSTEM)
mail -s '#{opts[:subject].gsub(/'/,"\'")}' #{to} <<EMAIL
#{opts[:body]}
EMAIL
SYSTEM
  end

end

__END__
for disk in `diskutil list | grep '^/dev/disk'`; do (diskutil info $disk | grep -P 'SMART.*          >(Verified|Not Supported)' || (echo "Problem:\n$(diskutil info $disk | grep SMART)\n\nFull Report:\n$(diskutil     >info $disk)" | mail -s "$(hostname): $disk SMART status problematic" $(whoami))); done
