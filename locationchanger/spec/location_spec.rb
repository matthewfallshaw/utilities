require File.join(File.dirname(__FILE__), "../lib/location")
%w[rubygems spec].each { |@l| require @l }

describe Location do
  before(:each) do
    @l = Location.new
  end
  
  describe "#to_s" do
    it "should output location and reason" do
      @l.stub(:location).and_return("ALocation")
      @l.stub(:reason).and_return("AReason")
      @l.to_s.should == "Location: ALocation (from AReason)"      
    end
  end
  describe "#ssid" do
    it "should return a string" do
      @l.ssid.should be_instance_of(String)
    end
  end
  describe "#enNip" do
    [:en0ip, :en1ip].each do |method|
      it "should return a string" do
        @l.send(method).should be_instance_of(String)
      end
      it "should be numeric or empty" do
        @l.send(method).split(/\./).each do |part|
          Numeric.should === part.to_i
        end
      end
    end
  end
  describe "#available_ssids" do
    it "should return an array of available ssids" do
      @l.stub(:available_ssid_command).and_return(<<-CMD)
             SSID BSSID             RSSI CHANNEL HT CC SECURITY (auth/unicast/group)
         bluenode 00:00:00:00:00:00 -34  11      N  -- WPA2(PSK/AES,TKIP/TKIP) 
         NCarlton 00:00:00:00:00:00 -80  6       N  GB WPA(PSK/TKIP/TKIP) 
             wino 00:00:00:00:00:00 -54  6       N  -- WPA(PSK/TKIP/TKIP) 
      BigPond2054 00:00:00:00:00:00 -75  4       N  US WPA(PSK/AES,TKIP/TKIP) WPA2(PSK/AES,TKIP/TKIP) 
      CMD
      @l.available_ssids.should == ["bluenode", "NCarlton", "wino", "BigPond2054"]
    end
  end
  describe "when airport power off" do
    before(:each) do
      @l.stub(:airport_power?).and_return(nil)
    end
  end
  describe "when airport power on" do
    before(:each) do
      @l.stub(:airport_power?).and_return(:on)
      @l.should_not_receive(:airport_power!)
    end
    describe "when on home ssid" do
      before(:each) do
        @l.stub(:ssid).and_return(Location::LOCATIONS["Canning"][:ssid])
      end
      it "#location should be Canning" do
        @l.location.should == "Canning"
      end
      it "#location should not call the expensive #available_ssid_command" do
        @l.should_not_receive(:available_ssid_command)
        @l.location
      end
      it "#reason should be :ssid" do
        @l.location
        @l.reason.should == :ssid
      end
    end
    describe "when no ssid and on home IP" do
      before(:each) do
        @l.stub(:ssid).and_return("")
        @l.stub(:en0ip).and_return(Location::LOCATIONS["Canning"][:en0ip])
      end
      it "#location should be Canning" do
        @l.location.should == "Canning"
      end
      it "#location should not call the expensive #available_ssid_command" do
        @l.should_not_receive(:available_ssid_command)
        @l.location
      end
      it "#reason should be :en0ip" do
        @l.location
        @l.reason.should == :en0ip
      end
    end
    describe "when no ssid and not home IP and work ssid available" do
      before(:each) do
        @l.stub(:ssid).and_return("")
        @l.stub(:en0ip).and_return("192.168.0.1")
      end
      it "#location should be Trike" do
        @l.stub(:available_ssids).and_return(["Other", Location::LOCATIONS["Trike"][:ssid], "Another"])
        @l.location.should == "Trike"
      end
      it "#location should call the expensive #available_ssid_command" do
        @l.should_receive(:available_ssid_command).at_least(:once).and_return(<<-CMD)
               SSID BSSID             RSSI CHANNEL HT CC SECURITY (auth/unicast/group)
           bluenode 00:00:00:00:00:00 -34  11      N  -- WPA2(PSK/AES,TKIP/TKIP) 
        CMD
        @l.location
      end
      it "#reason should be :available_ssid" do
        @l.stub(:available_ssids).and_return(["Other", Location::LOCATIONS["Trike"][:ssid], "Another"])
        @l.location
        @l.reason.should == :available_ssid
      end
    end
  end
end