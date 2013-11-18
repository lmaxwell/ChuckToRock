Gain master => dac;
0.5=>master.gain;
SawOsc chord[3];
SinOsc note;
0.2 => note.gain;

0.6::second => dur secondPerBeat;

[51,53,55,56,58,60,61,63] @=> int scale[];

[[51,1],[53,2],[55,2],[56,2]] @=> int melody[][];

0 => int beat;
while(beat < 200)
{
	playChord(1,"major",1.0,1.0);
	secondPerBeat => now;

	playChord(7,"major",1.0,1.0);
	secondPerBeat => now ;

	beat++;
}


playChord(1,"major",1.0,1.0);
1::second=>now;
1::second=>now;
playChord(2,"minor",1.0,1.0);
playChord(4,"major",1.0,1.0);
playChord(5,"minor",1.0,1.0);
playChord(6,"minor",1.0,1.0);
playChord(7,"major",1.0,1.0);

sampleChord(1,"major",1.0,0.2);
sampleChord(2,"minor",1.0,0.2);
sampleChord(4,"major",1.0,0.2);
sampleChord(5,"minor",1.0,0.2);
sampleChord(6,"minor",1.0,0.2);
sampleChord(7,"major",1.0,0.2);

playMelody(melody,0.5);

for (0=> int i;i< 8 ;i++)
{
		
//	playNote(scale[i],1.0,0.5);
}

fun void playChord(int degree,string quality,float beat,float gain)
{
	for (0=>int i;i<3;i++)
	{
		chord[i] => master;	
		gain/3 => chord[i].gain;
	}
	scale[degree-1] => Std.mtof => chord[0].freq;
	if (quality == "major")
		scale[degree-1] + 4=> Std.mtof => chord[1].freq;
	else
		scale[degree-1] + 3 + Math.random2(0,1)*12=> Std.mtof => chord[1].freq;
	scale[degree-1] + 7 + Math.random2(0,1)*12=> Std.mtof => chord[2].freq;
	beat * secondPerBeat => now;
	for (0=>int i;i<3;i++)
	{
		chord[i] =< master;	
	}
}


//play chord progression, not implemented yet
//fun void playChordProgression()


fun void sampleChord(int degree,string quality,float beat,float gain)
{
	note => master;
	gain => note.gain;
	int chordNotes[];
	scale[degree-1] => int root;
	if(quality == "major")
		[root, root +4, root +7] @=>chordNotes;
	else
		[root, root +3, root +7] @=>chordNotes;
	chordNotes[Math.random2(0,2)] + Math.random2(0,1)*12 => Std.mtof =>  note.freq;
	beat * secondPerBeat => now;
	note =< master;
}

fun void playNote(int midiNote,float beat,float gain)
{
	note => master;
	gain => note.gain;
	midiNote=> Std.mtof => note.freq;
	beat * secondPerBeat => now;
	note =< master;
}

fun void playMelody(int melody[][],float gain)
{
	note=> master;
	gain => note.gain;
	for(0=> int i;i<melody.cap();i++)
	{
		melody[i][0] => Std.mtof => note.freq;
		melody[i][1]*secondPerBeat => now;
	}
	note =< master;
}
