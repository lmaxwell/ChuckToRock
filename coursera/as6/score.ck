// score.ck
// Insert the title of your piece here

// Add your composition files when you want them to come in

Machine.add(me.dir() + "/drums.ck") => int drumID;

2.6::second=>now;
Machine.add(me.dir() + "/bass.ck") => int bassID;

2.6::second => now;
Machine.add(me.dir() + "/piano.ck") => int pianoID;
4.8::second => now;
10::second => now;

Machine.add(me.dir() + "/flute.ck") => int fluteID;

10::second => now;

Machine.remove(drumID);
Machine.remove(bassID);
Machine.remove(fluteID);
Machine.remove(pianoID);
