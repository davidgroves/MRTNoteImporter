# MRTNoteImporter
Simple WoW Addon for importing [Method Raid Tools](https://www.curseforge.com/wow/addons/method-raid-tools) notes into the game.

# Just using it.

Get it from all good wow addon providers !

- [Curseforge Link](https://www.curseforge.com/wow/addons/mrtnoteimporter)
- [WoWInterface Link](https://www.wowinterface.com/downloads/info26398-MRTNoteImporter.html)
- [Wago Link](https://addons.wago.io/addons/mrtnoteimporter)

Or directly from the releases here on github.


# Usage
In game, run `/mrtni`, and paste JSON into the window. The JSON should be formatted like

```
{ 
   "NoteName1": "This is the first note",
   "NoteName2": "This is the second note",
   "NoteName3": "This is the third note\nWith a linebreak\nAnd another one"}
}
```

For example
```
{
    "Flame Leviathan": "Kill robot tank thing",
    "Razorscale": "Kill dwarves.\nThen dragon.",
    "Ingis": "Kill big fire thing."
}
```

Alternatively, it can be a Base64 encoding of the JSON, if the "Base64" checkbox is selected (which is the default). So importing. `ewogICAgIjEgLSBBbnViIjogIktpbGwgYmlnIHVuZGVhZCB0aGluZ1xuQW5vdGhlciBsaW5lIGFib3V0IHRoZSB1bmRlYWQgdGhpbmcuIiwKICAgICIyIC0gR3JhbmQgV2lkb3ciOiAiS2lsbCB3b21hbiBhbmQgd29yc2hpcGVycyIsCiAgICAiMyAtIE1hZXh4bmEiOiAiS2lsbCBiaWcgc3BpZGVyIHRoaW5nIgp9
` is the similar to the example above.

You can also click the "Fetch Notes" button to export the notes you currently have in MRT in the JSON format.
