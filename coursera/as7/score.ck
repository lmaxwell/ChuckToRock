
//set song info
60/0.625 => SongInfo.tempo;
BPM bpm;
bpm.tempo(SongInfo.tempo);
[48,50,52,53,55,57,59,60] @=> SongInfo.scale;

Machine.add(me.dir() + "/drums.ck");
Machine.add(me.dir() + "/piano.ck");
BPM.quarterNote*16 => now;
//BPM.quarterNote*8=>now;
Machine.add(me.dir() + "/bass.ck");

