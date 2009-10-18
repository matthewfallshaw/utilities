class Location
  # locations (use to be used Location name here)
  LOCATIONS = {
    "Canning" => {
      :ssid => "bluenode",
      :en0ip => "192.168.42."
    },
    "Trike" => {
      :ssid => "airtrike",
      :en0ip => "192.168.1."
    },
    "Prior" => {
      :ssid => "PriorNet",
      :en0ip => "not used"
    },
  }
  
  attr_accessor :reason
  
  def to_s
    "Location: #{location} (from #{reason})"
  end
  
  def airport_power?
    `networksetup -getairportpower en1 2>/dev/null`.match(/On$/) && :on
  end
  def airport_power!(state = :on)
    state = :off if (state == 0 || [:off, :false].include?(state.to_sym) || state == false || state.nil?)
    `networksetup -setairportpower en1 #{state ? "on" : "off"} 2>/dev/null`
    state == :off ? nil : state
  end
  
  def ssid
    `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I\
     | grep ' SSID:' | cut -d ':' -f 2 | tr -d ' '`.chomp
  end
  
  def en0ip; enip(0); end
  def en1ip; enip(1); end
  
  def available_ssids
    available_ssid_command.split(/\n/).grep(/:/).collect { |line| line[/^\s+(\w+).*/,1] }
  end
  
  def location
    location_from_ssid || location_from_en0ip || location_from_available_ssids || location_from_fallback
  end
  
  def location_from_ssid
    return nil unless airport_power?
    LOCATIONS.each do |loc, props|
       if ssid == props[:ssid]
         self.reason = :ssid
         return loc 
      end
    end
    nil
  end
  def location_from_en0ip
    LOCATIONS.each do |loc, props|
      if en0ip.include?(props[:en0ip])
       self.reason = :en0ip
       return loc
     end
    end
    nil
  end
  def location_from_available_ssids
    return nil unless airport_power?
    LOCATIONS.each do |loc, props|
       if available_ssids.include?(props[:ssid])
         self.reason = :available_ssid
         return loc 
       end
    end
    nil
  end
  def location_from_fallback
    self.reason = :fallback
    "Automatic"
  end
  
  private
  
  def enip(num)
    `ifconfig en#{num} | grep 'inet ' | cut -d' ' -f 2`.chomp
  end
  def available_ssid_command
    @available_ssid_command ||=
      `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s`
  end
end
