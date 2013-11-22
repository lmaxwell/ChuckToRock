//Assignment_5_

Pan2 panChord => Gain master => dac;
0.7=>master.gain;
SawOsc chord[3];
Flute note => master;
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

0.75::second => dur secondPerBeat;


[49,50,52,54,56,57,59,61] @=> int scale[];

Flute flute => master;
Mandolin mandolin => dac;
0=> int i;

/*
while(i<scale.cap())
{
	scale[i] => Std.mtof => flute.freq;
	//flute.startBlowing(1.0);
	0.5=>flute.noteOn;
	0.5::second => now;
	//flute.stopBlowing(1.0);
	1.0=>flute.noteOff;
	scale[i]+Math.random2(0,1)*12 => Std.mtof =>mandolin.freq;
	0.5::second=>now;
	Math.randomf()=>mandolin.noteOn;
	0.5::second => now;
	1.0 => mandolin.noteOff;
	0.5::second => now;
	i++;
}
*/

int kickPtrn[];
int snarePtrn[];
int bassPtrn[];
int chordPtrn[];
int snare2Ptrn[8];
int melodyPtrn1[];
int melodyPtrn2[];

[1,0,0,0,1,0,0,0]@=> kickPtrn;
[0,0,1,0,0,0,1,0]@=> snarePtrn;
[1,0,1,0,1,0,1,0] @=>bassPtrn;
[1,2,0,1,1,1,2,2] @=>melodyPtrn1; // 1:note On 0:note Off 2:hold on
[2,0,1,0,1,1,2,0] @=>melodyPtrn2; 
[1,1,0,1,1,1,0,1] @=>chordPtrn;
while(true)
{
	playPattern(kickPtrn,snarePtrn,melodyPtrn1,1,"minor",bassPtrn);
	playPattern(kickPtrn,snarePtrn,melodyPtrn2,3,"major",bassPtrn);
	playPattern(kickPtrn,snarePtrn,melodyPtrn1,7,"minor",bassPtrn);
	playPattern(kickPtrn,snarePtrn,melodyPtrn2,4,"minor",bassPtrn);
}

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
		
		//snare2 reverse 
		//<<<snare2,snare2Ptrn[i]>>>;
		if(snare2Ptrn[i]==1)
		{
			snare2=>master;
			Math.random2f(-1,0)=>snare2.rate;
			0.5=>snare2.gain;
			snare2.samples()=>snare2.pos;
		}

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
			for (0=>int i;i<3;i++)
			{
				chord[i] => panChord;	
				Math.random2f(-1.0,1.0) => panChord.pan;
				0.3/3.0 => chord[i].gain;
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
		if(melodyPtrn[i]==1) //note on
		{
			note=>master;
			0.3=> note.gain;
			sampleChord(chordDegree,chordQuality,"melody") => Std.mtof => note.freq;
			1.0=>note.noteOn;
		}
		if(melodyPtrn[i]==0) //note off
		{
			note=<master;	
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

		secondPerHalfbeat*1/4=>now;
		
		bass =< master;

		secondPerHalfbeat*1/2=>now;
	
		for (0=>int i;i<3;i++)
		{
			chord[i] =< panChord;	
		}
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
