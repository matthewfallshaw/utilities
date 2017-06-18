#!/bin/bash

function fail {
    echo "Encountered error: $1"
    exit 1
}

if [ ! -s /usr/local/bin/brew ]; then
    xcode-select --install
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || fail "Homebrew failed to install"
fi

if [ ! -s /usr/local/bin/gsed ]; then
    echo "Installing gnu-sed with Homebrew"
    /usr/local/bin/brew update || fail "Homebrew failed to update its list of available software"
    /usr/local/bin/brew install gnu-sed || fail "Homebrew failed to install gnu-sed"
fi

echo "

Updating Epichrome files in /Applications/"
locate org.epichrome.helper-host.py | grep "/Applications" | awk '{ print "\""$0"\""; }' | xargs gsed -i -E -e 's/(\s*)import webbrowser/\1import subprocess/' -e 's/(\s*)webbrowser\.open\(message\['"'"'url'"'"'\]\)/\1subprocess.check_call\(["\/usr\/bin\/open", message['"'"'url'"'"']]\)/' -e 's/(\s*)except webbrowser.Error:/\1except subprocess.CalledProcessError:/'
echo "Finished updating Epichrome files in /Applications/
Here are the files changed:"
locate org.epichrome.helper-host.py | grep "/Applications" | awk '{ print $0; }'
echo "

Updating Epichrome files in existing apps"
gsed -i -E -e 's/(\s*)import webbrowser/\1import subprocess/' -e 's/(\s*)webbrowser\.open\(message\['"'"'url'"'"'\]\)/\1subprocess.check_call\(["\/usr\/bin\/open", message['"'"'url'"'"']]\)/' -e 's/(\s*)except webbrowser.Error:/\1except subprocess.CalledProcessError:/' ~/Library/Application\ Support/Epichrome/Apps/*/NativeMessagingHosts/org.epichrome.helper-host.py
echo "Finished updating Epichrome files in existing apps
Here are the results:"
ls -1 ~/Library/Application\ Support/Epichrome/Apps/*/NativeMessagingHosts/org.epichrome.helper-host.py
echo "

Operation complete. Please exit and reopen any Epichrome apps.


"
