//Assignment_5_random_rock
//try to make a delay feedback chain and set delay time to 3/4 beat to make a "U2" style delay rhythm
//melody: note is sampled from chord by sampleChord function, duration is determined randomly by random2(0,2), 0:note off, 1: note on, 2:hold on

 Gain gainChord => Pan2 panChord;
 panChord.left  => JCRev reverb=> dac.left;
 panChord.right  => JCRev reverb2=> dac.right;

Gain master=> dac;

0.8=>master.gain;
0.04=>reverb.mix;
0.2=>reverb2.mix; //diffrent reverb mix for left and right channel
SawOsc chord[3];

0.6=>gainChord.gain;
gainChord=> Gain feedBack => Delay eightdot => gainChord;
0.8=>feedBack.gain;
ADSR chordEnv=> gainChord;
chordEnv.set(0.0001,0.005,0.55,0.01);
for(0=>int i;i<3;i++)
{
	chord[i] => chordEnv;	
}

Flute note => Echo delay => master;
SawOsc bass;

SndBuf kick => master;
SndBuf snare => master;
SndBuf hihat => master;
SndBuf snare2 => master;

0.6=>kick.gain;
0.6=>snare.gain;
0.4=>hihat.gain;
me.dir() + "/audio/kick_02.wav" => kick.read;
me.dir() + "/audio/snare_02.wav" => snare.read;
me.dir() + "/audio/hihat_04.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare2.read;

kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
snare2.samples() => snare2.pos;

0.75::second => dur secondPerBeat;
secondPerBeat *2  => delay.max;
secondPerBeat * 2  => delay.delay;
0.6=>delay.mix;

secondPerBeat  => eightdot.max;
secondPerBeat * 3.0/4.0  => eightdot.delay;

[49,50,52,54,56,57,59,61] @=> int scale[];

Flute flute => master;




int kickPtrn[];
int snarePtrn[];
int bassPtrn[];
int chordPtrn[];
int melodyPtrn[];

[1,0,0,0,1,0,0,0]@=> kickPtrn;
[0,0,1,0,0,0,1,0]@=> snarePtrn;
[1,0,1,0,1,0,1,0] @=>bassPtrn;
[0,0,0,0,0,0,0,0] @=>melodyPtrn; // 1:note On 0:note Off 2:hold on 
								// actually, melody pattern is generated randomly in palyPattern() 
[1,0,0,1,0,1,0,0] @=>chordPtrn;



playPattern(kickPtrn,snarePtrn,melodyPtrn,1,"minor",bassPtrn); // 4 beats * 0.75 seconds/beat = 3 seconds
playPattern(kickPtrn,snarePtrn,melodyPtrn,3,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,melodyPtrn,7,"minor",bassPtrn);
playPattern(kickPtrn,snarePtrn,melodyPtrn,4,"minor",bassPtrn);


[1,0,0,0,1,0,0,0]@=> kickPtrn;
[0,1,0,1,0,1,0,1]@=> snarePtrn;
[1,0,1,0,1,0,1,0] @=>bassPtrn;
[0,0,0,0,0,0,0,0] @=>melodyPtrn;  
[0,1,0,1,1,0,0,1] @=>chordPtrn;

playPattern(kickPtrn,snarePtrn,melodyPtrn,1,"minor",bassPtrn); // 4 beats * 0.75 seconds/beat = 3 seconds
playPattern(kickPtrn,snarePtrn,melodyPtrn,3,"major",bassPtrn);
playPattern(kickPtrn,snarePtrn,melodyPtrn,7,"minor",bassPtrn);
playPattern(kickPtrn,snarePtrn,melodyPtrn,4,"minor",bassPtrn);

playPattern(kickPtrn,snarePtrn,melodyPtrn,7,"minor",bassPtrn);
playPattern(kickPtrn,snarePtrn,melodyPtrn,4,"minor",bassPtrn);
//ending
0=>kick.pos;
0=>hihat.pos;


scale[0]=>Std.mtof => chord[0].freq; //root note
scale[0]+3+Math.random2(0,2)*12=>Std.mtof=>chord[1].freq; //minor third note
scale[0] +7 +Math.random2(-1,1)*12=>Std.mtof=>chord[2].freq;//fifth note
chordEnv.keyOn();
Math.random2f(-1.0,1.0) => panChord.pan;
0.2::second=>now;
chordEnv.keyOff();
chordEnv.keyOn();
Math.random2f(-1.0,1.0) => panChord.pan;
0.2::second=>now;
chordEnv.keyOff();
chordEnv.keyOn();
Math.random2f(-1.0,1.0) => panChord.pan;
0.2::second=>now;
chordEnv.keyOff();
Math.random2f(-1.0,1.0) => panChord.pan;
1.4::second => now;


//play pattern
fun void playPattern(int kickPtrn[],int snarePtrn[],int melodyPtrn[],int chordDegree,string chordQuality,int bassPtrn[])
{
	secondPerBeat/2=>dur secondPerHalfbeat;
	
	for(0=>int i;i<kickPtrn.cap();i++)
	{
		
		//kick and snare
		if(kickPtrn[i]==1)
			0=>kick.pos;
		if(snarePtrn[i]==1)
			0=>snare.pos;
		
		//hihat at the first i
		if(i==0)
			0=>hihat.pos;
		
		//bass
		0.2=>bass.gain;
		if(bassPtrn[i]==1)
		{
			bass => master;
			sampleChord(chordDegree,chordQuality,"bass") => Std.mtof => bass.freq;
		}
		//chord

		if(chordPtrn[i]==1)
		{
			for (0=>int j;j<3;j++)
			{
				//chord[j] => chordEnv ;	
				1=>chordEnv.keyOn;
				0.8/3.0 => chord[j].gain;
			}
		}
		if(chordPtrn[i]==0)
		{
			;		
		}
		if(chordPtrn[i]==2)
		{
			;	
		}
		//melody
		Math.random2(0,2) => melodyPtrn[i];
		if(melodyPtrn[i]==1) //note on
		{
			//note=>master;
			0.4=> note.gain;
			sampleChord(chordDegree,chordQuality,"melody") => Std.mtof => note.freq;
			1.0=>note.noteOn;
		}
		if(melodyPtrn[i]==0) //note off
		{
			//note=<master;	
			1.0=>note.noteOff;
		}
		if(melodyPtrn[i]==2) //hold on
		{
			;	
		}

		scale[chordDegree-1]=>Std.mtof => chord[0].freq; //root note
		if(chordQuality=="major")
			scale[chordDegree-1]+4 + Math.random2(0,2)*12=>Std.mtof=>chord[1].freq; //major third note
		else
			scale[chordDegree-1]+3+Math.random2(0,2)*12=>Std.mtof=>chord[1].freq; //minor third note
		scale[chordDegree-1] +7 +Math.random2(-1,1)*12=>Std.mtof=>chord[2].freq;//fifth note

		Math.random2f(-1.0,1.0) => panChord.pan;
		//1.0=>panChord.pan;
		secondPerHalfbeat*1/4=>now;
		
			bass =< master;

		secondPerHalfbeat*1/2=>now;
		
		1=>chordEnv.keyOff;

		secondPerHalfbeat*1/4=>now;

		//note=<master;
	}
}

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
