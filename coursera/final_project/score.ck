
//set song info
100 => SongInfo.tempo;
BPM bpm;
bpm.tempo(SongInfo.tempo);
[46,48,49,51,53,54,56,58] @=> SongInfo.scale;

Machine.add(me.dir() + "/drums.ck");
Machine.add(me.dir() + "/piano.ck");
BPM.quarterNote*16 => now;
//BPM.quarterNote*8=>now;
Machine.add(me.dir() + "/bass.ck");

