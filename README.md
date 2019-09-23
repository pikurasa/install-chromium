# install-chromium

Simple script to:

* Install the latest version of Chromium (using another script from GitHub)
* Removes the script when finished

Known issues:

* One would need to modify "user:user" to their own user name in order for permissions to be accurate
* If the user is on open wifi (like at an airport) the script may pass the Internet Connectivity test, but fail to connect to the Internet. This is because it simply pings google.com, which the open wifi will report is reachable.

Basically, this script just helped me automate installation of Chromium for a few machines I have.