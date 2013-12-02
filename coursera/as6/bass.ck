// bass.ck
// Insert the title of your piece here

// Part of your composition goes here

[46,48,49,51,53,54,56,58] @=> int scale[];
0.65::second => dur durPerBeat;
Mandolin bass =>Gain master =>  dac;
0.4=>bass.gain;
0.015=>bass.bodySize;
0.4=>bass.pluckPos;
0.005=>bass.stringDamping;
0.001=>bass.stringDetune;


int bassPtrn[8];
while(true){
	playBassPattern(bassPtrn,4,"minor");
	playBassPattern(bassPtrn,7,"major");
	playBassPattern(bassPtrn,3,"major");
	playBassPattern(bassPtrn,6,"major");
	playBassPattern(bassPtrn,2,"diminished");
	playBassPattern(bassPtrn,5,"major");
	playBassPattern(bassPtrn,1,"minor");
	playBassPattern(bassPtrn,1,"minor");
}


//play pattern
fun void playBassPattern(int bassPtrn[],int chordDegree,string chordQuality)
{
		
	for(0=>int i;i<bassPtrn.cap();i++)
	{
		
			//bass
		if(i%8==0)
			1=>bassPtrn[i];
		else
			Math.random2(0,2)=>bassPtrn[i];
		if(bassPtrn[i]==1)
		{
			sampleChord(chordDegree,chordQuality,"bass") => Std.mtof => bass.freq;
			1.0=>bass.noteOn;
		}
		else if(bassPtrn[i]==0)
		{
			1.0=>bass.noteOff;	
		}
	
	
		durPerBeat*1/4=>now;

	}
}
fun int sampleChord(int degree,string quality,string type)
{
	int chordNotes[];
	scale[degree-1] => int root;
	if(quality == "major")
		[root, root +4, root +7] @=>chordNotes;
	else if (quality == "minor")
		[root, root +3, root +7] @=>chordNotes;
	else 
		[root,root+2,root+6] @=>chordNotes;
	if(type=="bass")
		return chordNotes[Math.random2(0,2)] - Math.random2(1,2)*12 ;
	else
		return chordNotes[Math.random2(0,2)] + Math.random2(1,2)*12 ;
	
}
