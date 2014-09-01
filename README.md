# icsfilter

icsfilter provides a basic way to filter events or change wording in ics files using the command line. In addition to local files it also works with online ics calendars that you can't otherwise change the output of.

In combination with launchd and [ControlPlane](http://www.controlplaneapp.com/) it's proven to be very useful to me. [See Examples for more](#examples).


## Installation

### Installation from the source

You can download icsfilter's source either it by cloning it through git with the following command:

    git clone https://github.com/sachse/icsfilter.git

Or you can just [download a ZIP](https://github.com/sachse/icsfilter/archive/master.zip).

If you install from the source you will also have to install icsfilter's depencies with Bundler:

    bundle install


## How to use

To use icsfilter you need to know how to construct regular expressions that target whatever you want to filter. Do NOT include the slashes (`/`) that often delimit regular expressions.

icsfilter accepts two command line options, `--remove` and `--filter`. Both can be passed multiple times in the samme command if you want to remove or filter multiple things at once.

`--remove`, `-r` will completely remove all events whose summaries match the regular expression passed to it.

`--filter`, `-f` filters out regular expression matches from event summaries. It does not remove the event itself.

icsfilter removes events before filtering event summaries, so don't make your regular expressions for removal match something that would only be found after filtering.

**N.B.:** If your ics file contains multiple calendars icsfilter will only process and republish the first one.


### Examples

A contrived example showing how icsfilter can be used could be something like this:

    ./bin/icsfilter -r '\ARemove this event' -r '(\WAlso remove this\W|\Wor this\W)' -f 'filter out this sentence\Z' http://some.tld/webcalendar $HOME/Desktop/filtered-calendar.ics

If no output argument (the last one) is given, icsfilter will try to save to the file that was given as input.

Personally, I use icsfilter for both my university and work calendars, which are both published online. I then store the filtered ics files on a server (in this case Dropbox's Public folder works perfectly) and can then subscribe to them in Calendar. This way the filtered calendars also work on my phone.

The following screenshots show the two calendars before and after filtering:

![Calendar image before icsfilter was used](/../screenshots/before.png?raw=true "Before")

![Calendar image after icsfilter was used](/../screenshots/after.png?raw=true "After")
