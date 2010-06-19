def notify(message)
  require 'shellwords'
  `/usr/local/bin/growlnotify -a Quicksilver -m #{message.shellescape}`
  message
end
