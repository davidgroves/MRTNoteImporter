# MRTNoteImporter
Simple WoW Addon for importing [Method Raid Tools](https://www.curseforge.com/wow/addons/method-raid-tools) notes into the game.

# Video and Examples.

See the [Joardee Video](https://www.youtube.com/watch?v=2S73R7HliIg) on Assignment sheets for a usage example, as well a set
of compatible assignment spreadsheets.

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

Alternatively, it can be a Base64 encoding of the JSON. So importing. `ewogICAgIjEgLSBBbnViIjogIktpbGwgYmlnIHVuZGVhZCB0aGluZ1xuQW5vdGhlciBsaW5lIGFib3V0IHRoZSB1bmRlYWQgdGhpbmcuIiwKICAgICIyIC0gR3JhbmQgV2lkb3ciOiAiS2lsbCB3b21hbiBhbmQgd29yc2hpcGVycyIsCiAgICAiMyAtIE1hZXh4bmEiOiAiS2lsbCBiaWcgc3BpZGVyIHRoaW5nIgp9
` is the similar to the example above.

If the import string starts with `{` and ends with `}`, it will be parsed as JSON. Otherwise, as Base64 encoded JSON.

You can also click the "Fetch Notes" button to export the notes you currently have in MRT in the JSON format.

Note, importing notes will REPLACE all your existing notes with these new ones. Your current notes will be lost. 
You should export them first if you want to preserve them.

# Feedback

Options for feedback include.
- Raise a Github issue or Pull request.
- Find me as Pumpkin on [Joardee's Discord](https://discord.gg/V6PeJRav5n) 