#!/usr/bin/perl

use 5.010;
use vars qw($VERSION);
use strict;
use warnings;
use Getopt::Long qw(GetOptions);
Getopt::Long::Configure qw(gnu_getopt);
use Cwd 'abs_path';
use File::Basename;

####################
# DISCLAIMER:
#   No warranty, whether explicit or implied, comes with the use of this app.
#   algb12 (herefrom referred to as "the author") takes no responsibility for any damage caused by this software or its component.
#   The software is unlicensed, meaning that it is part of the public domain.
#   It may be sold, modified, shipped as part of a package, or used in any way, as long as this disclaimer, in its unaltered form, is present.
####################

# This script toggles App Nap, which makes background apps use less resources if not used for a period of time.
# Sometimes, though, apps have to do work in the background without getting throttled.
# For this purpose, this script eases the toggling of App Nap functionality for single apps, a list of apps or even a directory of apps.
# App Nap state can be reset to automatic (pre AppNapToggle.pl) state as well. Can handle binary .plist containing apps.

####################
# TODO:
#   - ? Fix / disable case sensitivity for Info.plist CFBundleidentifier, so it works with all Info.plist files, no matter the case (or are all plists case-sensitiv anyways???)
#   - Create a multi-app mode, so that many apps can have App Nap toggled at once (NOTE: it may be possible to just check the number of args provided, and treat multiple args as multiple apps instead)
#     - DONE: Migrated to array-based file-handling, which allows for multiple args
#   - Create a directory mode, so that all apps in a praticular directory can have App Nap toggled simultaneously
#     - DONE: Said array-based file-handling coupled with grep takes list of directories ending with .app and turns them into an array.
#   - Add ability of reading CFBundleIdentifier from binary .plist files
#     - DONE: plutil temporarily converts plist to XML-based plist, then back into binary form (possible improvement: rather than convert the .plist file itself, create a copy of binary plist in XML format for reading, then delete the copy when unneeded)
#   - Test on other OS X versions (e.g. Mavericks, El Capitan etc.). This version of AppNapToggle.pl was tested on OS X Yosemite (10.10.4).
#     - NOTE: Volunteers ready to test it on other versions os OS X are welcome. If tested on other versions, please tell me whether the defaults write property is correct, or whether it has to be changed for 10.9 and 10.11...
####################

# Define initial global vars
my $dir;
my $reset;
my @apps;

# Check whether directory mode is enabled
GetOptions('dir|d=s' => \$dir, 'r' => \$reset) or die "Usage: $0 --dir [-r] /path/to/dir-with-apps. The -r flag resets AppNap state to pre-AppNapToggle.pl use.\n";

# Quit unless app(s) are supplied or directory with apps
print "######## AppNapToggle.pl ########\n";
# If no directory flag with directory set, use user-supplied apps
if (!$dir) {
  # Check for at least 1 argument (app)
  my $num_args = $#ARGV + 1;
  if ($num_args < 1) {
    die "Error: No app specified. Usage: AppNapToggle.pl /path/to/app or AppNapToggle.pl [--dir|-d][-r] /path/with/apps. The -r flag resets AppNap state to pre-AppNapToggle.pl use.\n";
  }
  # Put apps into @app array
  @apps = @ARGV;
} elsif (-d $dir) {
  # If directory mode used, get all apps in directory
  opendir(DIR, $dir);
  @apps = grep { /\.app$/mxs } map { "$dir/$_" } readdir(DIR);
  closedir(DIR);
}

foreach my $app_path (@apps) {
  # Got an argument, assume it is app path
  $app_path = $1 if ($app_path =~ /(.*)\/$/mxs);
  $app_path = abs_path($app_path);

  # Check whether the app path provided exists (apps are directories)
  if (-d "$app_path") {

    # Check whether the app contains an Info.plist file
    my $plist_file = $app_path . "/Contents/Info.plist";
    if (-e $plist_file) {
      print "Info.plist found: $plist_file\n";
      # Create variable $plist for content of Info.plist to be stored
      my $plist;
      # If .plist is binary, convert it to XML for reading
      my $isConverted;
      if (-f -B $plist_file) {
        $isConverted = 1;
        print "$plist_file has been identified as an older .plist of binary format. Converting into XML-based .plist to allow R/W access.\n";
        system("plutil -convert xml1 $plist_file");
      }
      print "Opening $plist_file for storing.\n";
      # Associate Info.plist file with a file handle
      open(my $plist_fh, "<", $plist_file) or do {print "Cannot open file $plist_file"; next;};
      {
        # Restore initial value of $/
        local $/ = undef;
        # Store content of plist file-handle in plist var
        print "Storing data in variable.\n";
        $plist = <$plist_fh>;
      }
      # Close plist file-handle. From this point onwards, the original Info.plist cannot be overwritten accidentally by a bug.
      print "Closing $plist_file\n";
      close($plist_fh) or die "unable to close: $!";
      # Convert plist back to binary, if it was converted to XML for reading
      if ($isConverted) {
        print "Converting $plist_file back into binary form.\n";
        system("plutil -convert binary1 $plist_file");
      }
      # Get CFBundleIdentifier tag from Info.plist
      print "Reading CFBundleIdentifier...\n";
      my ($cfbundleidentifier) = $plist =~ /<key>CFBundleIdentifier<\/key>.*?<string>(.*?)<\/string>/gmxs;

      print "Got CFBundleIdentifier: $cfbundleidentifier\n";

      # Is AppNap disabled?
      my $appnap_disabled = `defaults read $cfbundleidentifier NSAppSleepDisabled 2>/dev/null`;

      # Message engine
      my $appnap_disabled_literal;
      my $appnap_future_state;
      my $action;
      if ($reset) {
        if ($appnap_disabled eq q{}) {
          $appnap_disabled_literal = "undefined";
          $action = "Resetting";
          $appnap_future_state = "resetted";
        } elsif ($appnap_disabled == 0) {
          $appnap_disabled_literal = "enabled";
          $action = "Resetting";
          $appnap_future_state = "resetted";
        } elsif ($appnap_disabled == 1) {
          $appnap_disabled_literal = "disabled";
          $action = "Resetting";
          $appnap_future_state = "resetted";
        }
      } elsif ($appnap_disabled eq q{}) {
        $appnap_disabled_literal = "undefined";
        $action = "Enabling";
        $appnap_future_state = "enabled";
      } elsif ($appnap_disabled == 0) {
        $appnap_disabled_literal = "enabled";
        $action = "Disabling";
        $appnap_future_state = "disabled";
      } elsif ($appnap_disabled == 1) {
        $appnap_disabled_literal = "disabled";
        $action = "Enabling";
        $appnap_future_state = "enabled";
      }

      if ($? == 0) {
        # Option for resetting the state set by previous AppNapToggle.pl usages when -r flag is passed
        print "Current state: App Nap is $appnap_disabled_literal. $action App Nap.\n";
        if ($reset) {
          system("defaults delete $cfbundleidentifier NSAppSleepDisabled >/dev/null");
        } elsif ($appnap_disabled == 0) {
          system("defaults write $cfbundleidentifier NSAppSleepDisabled -bool YES >/dev/null");
        } elsif ($appnap_disabled == 1) {
          system("defaults write $cfbundleidentifier NSAppSleepDisabled -bool NO >/dev/null");
        }
        print "New state: App Nap $appnap_future_state. Restart app to apply changes.\n";
      } elsif ($reset) {
        print "Nothing to be resetted. Exiting / skipping to next app.\n";
        next;
      } else {
        print "State not set. Disabling App Nap, assuming it is enabled by default.\n";
        system("defaults write $cfbundleidentifier NSAppSleepDisabled -bool YES >/dev/null");
        print "New state: App Nap disabled.  Restart app to apply changes.\n";
      }
    } else {
      print "No Info.plist file found. Exiting / skipping to next app.\n";
      next;
    }
  } else {
    print "App path is invalid. Exiting.\n";
    next;
  }
}