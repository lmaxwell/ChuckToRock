// piano.ck
// Insert the title of your piece here
[46,48,49,51,53,54,56,58] @=> int scale[];
0.65::second => dur durPerBeat;


// Part of your composition goes here


Rhodey chord[3];
Pan2 pan => dac;
for(0=>int i; i<3;i++)
{
	chord[i]=>pan;
	0.6=>chord[i].gain;
}

[1,2,1,2,2,1,0,0,0,1,0,0,1,2,0,0] @=> int chordPtrn[];


while(true){
	playChordPattern(chordPtrn,4,"minor");
	playChordPattern(chordPtrn,7,"major");
	playChordPattern(chordPtrn,3,"major");
	playChordPattern(chordPtrn,6,"major");
	playChordPattern(chordPtrn,2,"diminished");
	playChordPattern(chordPtrn,5,"major");
	playChordPattern(chordPtrn,1,"minor");
	playChordPattern(chordPtrn,1,"minor");
}


fun void playChordPattern(int chordPtrn[],int chordDegree,string chordQuality)
{
	
	for(0=>int i;i<chordPtrn.cap();i++)
	{
		

		//chord
		Math.random2(0,2)=>chordPtrn[i];
		if(chordPtrn[i]==1)
		{
			for (0=>int j;j<3;j++)
			{
				1=>chord[j].noteOn;
			}
		}
		if(chordPtrn[i]==0)
		{
			for (0=>int j;j<3;j++)
			{
				1=>chord[j].noteOff;
			}
		}
		if(chordPtrn[i]==2)
		{
			;	
		}
		scale[chordDegree-1]=>Std.mtof => chord[0].freq; //root note
		if(chordQuality=="major")
			scale[chordDegree-1]+4 + Math.random2(0,2)*12=>Std.mtof=>chord[1].freq; //major third note
		else
			scale[chordDegree-1]+3+Math.random2(0,2)*12=>Std.mtof=>chord[1].freq; //minor third note

		if(chordQuality=="diminished")
			scale[chordDegree-1] +6 +Math.random2(-1,1)*12=>Std.mtof=>chord[2].freq;//fifth note
		else
			scale[chordDegree-1] +7 +Math.random2(-1,1)*12=>Std.mtof=>chord[2].freq;//fifth note

		Math.random2f(-1.0,1.0) => pan.pan;
		//1.0=>panChord.pan;
		durPerBeat*1/4=>now;
	
	}
}


//play Chord
fun void playChord(int degree,string quality,float gain)
{
	for(0=>int i;i<3;i++)
	{
		1.0 => chord[i].noteOn;	
		gain/3 => chord[i].gain;
	}
	scale[degree-1] => Std.mtof => chord[0].freq;
	if (quality == "major")
		scale[degree-1] + 4=> Std.mtof => chord[1].freq;
	else
		scale[degree-1] + 3 + Math.random2(0,1)*12=> Std.mtof => chord[1].freq;
	scale[degree-1] + 7 + Math.random2(0,1)*12=> Std.mtof => chord[2].freq;

}


