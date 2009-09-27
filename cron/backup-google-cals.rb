#!/usr/bin/env ruby
Dir.chdir("/Users/matt/Dropbox/Archive")
threads = []
[
%w[matthewfallshaw matthew.fallshaw%40gmail.com/private-498f1b544e3bc3cef0b79fd518788d65/basic.ics],
%w[investling      gvjvijca7f17u6gooad1880940%40group.calendar.google.com/private-427ab63f74e186d04db3b6549e4f7231/basic.ics],
%w[trikeit         5o40b9riv84niiuii69hh893t8%40group.calendar.google.com/private-63ea807d17fafff496d48d927ea268a4/basic.ics],
%w[trikeitshared   dnv17juvgme52i520fj9pahf6g%40group.calendar.google.com/private-5ecb23fc0789d0990e701d8692927f36/basic.ics],
%w[trikemtgrm      fjch0inl5i4uqjs8t1kvqaoduk%40group.calendar.google.com/private-f716d7754e07965b8fe68912ba7a9917/basic.ics],
].each do |file, addr|
  threads << Thread.new(file, addr) do |file, addr|
    `wget http://www.google.com/calendar/ical/#{addr} -O #{file}.ics`
  end
end
threads.each { |t| t.join }
