//Assignment_4_SlowWalk
// using playPattern() function to make music form
// bass and melody note is sampled from chord by sampleChord() function.
// there are two snares , one normal, one reversed, reversed one's pattern is generated randomly by genSnare2Ptrn() function


Gain master => dac;
0.7=>master.gain;
SawOsc chord[3];
SinOsc note;
SawOsc bass;

SndBuf kick => master;
SndBuf snare => master;
SndBuf hihat => master;
SndBuf snare2 => master;

0.8=>kick.gain;
1.0=>snare.gain;
me.dir() + "/audio/kick_02.wav" => kick.read;
me.dir() + "/audio/snare_02.wav" => snare.read;
me.dir() + "/audio/hihat_04.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare2.read;

kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
snare2.samples() => snare2.pos;

0.6::second => dur secondPerBeat;


[51,53,55,56,58,60,61,63] @=> int scale[];

[[51,1],[53,2],[55,2],[56,2]] @=> int melody[][];

/*
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

*/

int kickPtrn[];
int snarePtrn[];
int bassPtrn[];
int clickPtrn[];
int snare2Ptrn[4];
//pattern for section 1
[1,0,1,0]@=> kickPtrn;
[0,1,0,1]@=> snarePtrn;
[1,0,1,0] @=>bassPtrn;

genSnare2Ptrn(4);
//play section 1;
playPattern(kickPtrn,snarePtrn,snare2Ptrn,1,"major",bassPtrn); //4 beats * 0.6 secondPerBeat = 2.4 seconds
playPattern(kickPtrn,snarePtrn,snare2Ptrn,7,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,snare2Ptrn,4,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,snare2Ptrn,1,"major",bassPtrn);

//pattern for section 2
[1,1,1,1] @=> kickPtrn;
[0,1,0,1] @=> snarePtrn;
[1,1,1,1] @=> bassPtrn;
genSnare2Ptrn(4);
//play section 2
playPattern(kickPtrn,snarePtrn,snare2Ptrn,1,"major",bassPtrn); //4 beats * 0.6 secondPerBeat = 2.4 seconds
playPattern(kickPtrn,snarePtrn,snare2Ptrn,7,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,snare2Ptrn,4,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,snare2Ptrn,1,"major",bassPtrn);

//pattern for section 3
[1,1,1,1] @=> kickPtrn;
[1,1,1,1] @=> snarePtrn;
[1,1,1,1] @=> bassPtrn;
genSnare2Ptrn(4);
//play section 3

playPattern(kickPtrn,snarePtrn,snare2Ptrn,1,"major",bassPtrn); //4 beats * 0.6 secondPerBeat = 2.4 seconds
playPattern(kickPtrn,snarePtrn,snare2Ptrn,7,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,snare2Ptrn,4,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,snare2Ptrn,1,"major",bassPtrn);

//ending
0=>hihat.pos;
snare2.samples()=>snare2.pos;
playChord(1,"major",0.5,0.4); //0.5 beat * 0.6 secondsPerBeat = 0.3 seconds
0.5*secondPerBeat => now;         // 0.5 beat silence;   
snare2.samples()=>snare2.pos;
playChord(1,"major",1,0.4); // beat * 0.6 secondsPerBeat = 0.6 seconds


// functions 

//play pattern
fun void playPattern(int kickPtrn[],int snarePtrn[],int snare2Ptrn[],int chordDegree,string chordQuality,int bassPtrn[])
{
	for(0=>int beat;beat<kickPtrn.cap();beat++)
	{

		//kick and snare
		if(kickPtrn[beat]==1)
			0=>kick.pos;
		if(snarePtrn[beat]==1)
			0=>snare.pos;
		
		//hihat at the first beat
		if(beat==0)
			0=>hihat.pos;
		
		//snare2 reverse 
		//<<<snare2,snare2Ptrn[beat]>>>;
		if(snare2Ptrn[beat]==1)
		{
			snare2=>master;
			Math.random2f(-1,0)=>snare2.rate;
			0.5=>snare2.gain;
			snare2.samples()=>snare2.pos;
		}

		//bass
		0.2=>bass.gain;
		if(bassPtrn[beat]==1)
		{
			bass => master;
			sampleChord(chordDegree,chordQuality,"bass") => Std.mtof => bass.freq;
		}
		//chord
		for (0=>int i;i<3;i++)
		{
		chord[i] => master;	
		0.3/3.0 => chord[i].gain;
		}
		
		//melody
		note=>master;
		0.3=> note.gain;
		sampleChord(chordDegree,chordQuality,"melody") => Std.mtof => note.freq;



		scale[chordDegree-1]=>Std.mtof => chord[0].freq; //root note
		if(chordQuality=="major")
			scale[chordDegree-1]+4 + Math.random2(0,2)*12=>Std.mtof=>chord[1].freq; //major third note
		else
			scale[chordDegree-1]+3+Math.random2(0,2)*12=>Std.mtof=>chord[1].freq; //minor third note
		scale[chordDegree-1] +7 +Math.random2(-1,1)*12=>Std.mtof=>chord[2].freq;//fifth note

		secondPerBeat*1/4=>now;
		
		bass =< master;

		secondPerBeat*1/2=>now;
	
		for (0=>int i;i<3;i++)
		{
			chord[i] =< master;	
		}
		
		secondPerBeat*1/4=>now;

		note=<master;
	}
}


//sample a note from chord, return midi note
fun int sampleChord(int degree,string quality,string type)
{
	int chordNotes[];
	scale[degree-1] => int root;
	if(quality == "major")
		[root, root +4, root +7] @=>chordNotes;
	else
		[root, root +3, root +7] @=>chordNotes;
	
	if(type=="bass")
		return chordNotes[Math.random2(0,2)] - Math.random2(1,2)*12 ;
	else
		return chordNotes[Math.random2(0,2)] + Math.random2(1,2)*12 ;
	
}

//random generate a snare pattern
fun void genSnare2Ptrn(int beat)
{
	for(0=>int i;i<beat;i++)
	{
		//<<<i>>>;
		Math.random2(0,1) => snare2Ptrn[i];	
	}
}


//play Chord
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



/*********************** unused functions, maybe used in latter assignments******************************
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

******************************************/
