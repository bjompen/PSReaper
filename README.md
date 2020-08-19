# PSReaper

Control reaper using PowerShell.

## Get started

This module uses the web remote control of reaper.
Enable it in reaper by going to

```Text
Options -> Preferences
Control/OSC/Web
Add web browser interface and remember the address
```

You can, of course, make connecting easier by using DNS names or something, but I haven't bothered with this (and it doesn't really matter)

This should also work over network/internet (assuming you have your firewalls and forwarders set up.)

This module will automatically try to connect using 'http://127.0.0.1:8080' as URI.
If you want to use something else, just run

```PowerShell
Connect-PSReaper -ReaperHost 'http://yourhost'
```

----

### Implemented so far

* Some basic get commands to read project and track data.
* one set command to change some track settings.
* Project settings, record, playback, loop, and more.

***I haven't yet implemented help. I might do that later***

### Requests? Missing something?

Leave a report or request in Issues

----

If you're curious about using Reaper DAW, you can go to [www.reaper.fm](https://www.reaper.fm/) and get a free trial full version!
