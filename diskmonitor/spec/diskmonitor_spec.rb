require "diskmonitor"

describe DiskMonitor do
  before do
    DiskMonitor.stub(:`).with("diskutil list | grep '^/dev/disk'").and_return("/dev/disk0\n/dev/disk1\n/dev/disk2")
    DiskMonitor.stub(:`).with("diskutil info disk0").and_return(VERIFIED)
    DiskMonitor.stub(:`).with("diskutil info disk1").and_return(FAILING)
    DiskMonitor.stub(:`).with("diskutil info disk2").and_return(NOTSUPPORTED)
  end

  it "should list drives" do
    DiskMonitor.drives.should == %w[disk0 disk1 disk2]
  end

  {
    :disk0 => "Verified",
    :disk1 => "Failing",
    :disk2 => "Not Supported",
  }.each do |disk, status|
    it "should report SMART status #{status} for drive #{disk}" do
      DiskMonitor.status(disk).should == status
    end
  end

  it "should list problematic drives" do
    DiskMonitor.problematic_drives.should == %w[disk1]
  end

  it "should email reports about problematic drives" do
    DiskMonitor.stub(:`).with("whoami").and_return("matt")
    DiskMonitor.stub(:`).with("hostname").and_return("notnux")
    DiskMonitor.should_receive(:system).with(/mail.+-s '/)

    DiskMonitor.mail_problematic_drives
  end
end

VERIFIED = "   Device Identifier:        disk0\n   Device Node:              /dev/disk0\n   Part of Whole:            disk0\n   Device / Media Name:      OWC Mercury Extreme Pro RE SSD Media\n\n   Volume Name:              Not applicable (no file system)\n\n   Mounted:                  Not applicable (no file system)\n\n   File System:              None\n\n   Content (IOContent):      GUID_partition_scheme\n   OS Can Be Installed:      No\n   Media Type:               Generic\n   Protocol:                 SATA\n   SMART Status:             Verified\n\n   Total Size:               200.0 GB (200049647616 Bytes) (exactly 390721968 512-Byte-Blocks)\n   Volume Free Space:        Not applicable (no file system)\n   Device Block Size:        512 Bytes\n\n   Read-Only Media:          No\n   Read-Only Volume:         Not applicable (no file system)\n   Ejectable:                No\n\n   Whole:                    Yes\n   Internal:                 Yes\n   Solid State:              Yes\n   OS 9 Drivers:             No\n   Low Level Format:         Not supported\n\n"
FAILING = "   Device Identifier:        disk1\n   Device Node:              /dev/disk1\n   Part of Whole:            disk1\n   Device / Media Name:      OWC Mercury Extreme Pro RE SSD Media\n\n   Volume Name:              Not applicable (no file system)\n\n   Mounted:                  Not applicable (no file system)\n\n   File System:              None\n\n   Content (IOContent):      GUID_partition_scheme\n   OS Can Be Installed:      No\n   Media Type:               Generic\n   Protocol:                 SATA\n   SMART Status:             Failing\n\n   Total Size:               200.0 GB (200049647616 Bytes) (exactly 390721968 512-Byte-Blocks)\n   Volume Free Space:        Not applicable (no file system)\n   Device Block Size:        512 Bytes\n\n   Read-Only Media:          No\n   Read-Only Volume:         Not applicable (no file system)\n   Ejectable:                No\n\n   Whole:                    Yes\n   Internal:                 Yes\n   Solid State:              Yes\n   OS 9 Drivers:             No\n   Low Level Format:         Not supported\n\n"
NOTSUPPORTED = "   Device Identifier:        disk2\n   Device Node:              /dev/disk2\n   Part of Whole:            disk2\n   Device / Media Name:      WD My Book 1140 Media\n\n   Volume Name:              Not applicable (no file system)\n\n   Mounted:                  Not applicable (no file system)\n\n   File System:              None\n\n   Content (IOContent):      GUID_partition_scheme\n   OS Can Be Installed:      No\n   Media Type:               Generic\n   Protocol:                 USB\n   SMART Status:             Not Supported\n\n   Total Size:               3.0 TB (3000558944256 Bytes) (exactly 5860466688 512-Byte-Blocks)\n   Volume Free Space:        Not applicable (no file system)\n   Device Block Size:        4096 Bytes\n\n   Read-Only Media:          No\n   Read-Only Volume:         Not applicable (no file system)\n   Ejectable:                Yes\n\n   Whole:                    Yes\n   Internal:                 No\n   OS 9 Drivers:             No\n   Low Level Format:         Not supported\n\n"

__END__
for disk in `diskutil list | grep '^/dev/disk'`; do (diskutil info $disk | grep -P 'SMART.*          >(Verified|Not Supported)' || (echo "Problem:\n$(diskutil info $disk | grep SMART)\n\nFull Report:\n$(diskutil     >info $disk)" | mail -s "$(hostname): $disk SMART status problematic" $(whoami))); done
