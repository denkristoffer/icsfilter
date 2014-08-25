# icsfilter

icsfilter provides a basic way to filter events or change wording in ics files using the command line. In addition to local files it also works with online ics calendars that you can't otherwise change the output of.

In combination with launchd and [ControlPlane](http://www.controlplaneapp.com/) it's proven to be very useful to me. See [screenshots here](#screenshots).


## Installation

At the moment icsfilter is only available through GitHub, as the code requires you to change parts of it anyway. You can get it by cloning it through git with

    git clone https://github.com/sachse/icsfilter.git

Or you can just [download a ZIP](/archive/master.zip)


## How to use

icsfilter currently requires you to modify the source code so that it uses your own regular expressions when filtering:

Open the `bin/icsfilter` file in your editor of choice. Locate the lines setting the variables `filters` and `targets` [(see here)[(https://github.com/sachse/icsfilter/blob/5fd4ab15109e0d5e3531807d6366c0958db95aa4/bin/icsfilter#L11-12) and change the regular expression unions to match your needs.


## Screenshots

Personally, I use icsfilter for both my university and work calendars. These screenshots show the calendars before and after:

![Calendar image before icsfilter was used](/../screenshots/before.png?raw=true "Before")

![Calendar image after icsfilter was used](/../screenshots/after.png?raw=true "After")
