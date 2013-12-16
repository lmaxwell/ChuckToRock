// bass.ck
// randomBass() play sixteen note randomly 
// walkingBass() eightnote walking bass

SongInfo.scale @=> int scale[];

BPM.quarterNote => dur quarterNote;
Mandolin bass =>JCRev reverb =>Gain master =>  dac;
0.04=>reverb.mix;
0.3=>bass.gain;
0.015=>bass.bodySize;
0.4=>bass.pluckPos;
0.005=>bass.stringDamping;
0.001=>bass.stringDetune;


0=>int count;
while(count<2)
{
	randomBass(1,"minor");
	randomBass(6,"major");
	count++;
}

walkingBass(1,"minor");
walkingBass(6,"major");
walkingBass(4,"minor");


/*
walkingBass(4,"minor");
walkingBass(7,"major");
randomBass(3,"major");
randomBass(6,"major");
randomBass(2,"diminished");
randomBass(5,"major");
walkingBass(1,"minor");
randomBass(2,"diminished");
randomBass(5,"major");
walkingBass(1,"minor");
*/
//ending
sampleChord(1,"minor","bass") => Std.mtof => bass.freq;
1.0=>bass.noteOn;
1.4::second => now;
    

//play bass in sixteen note
fun void randomBass(int chordDegree,string chordQuality)
{
	int bassPtrn;
	for(0=>int i;i<16;i++)
	{
		
			//bass
		if(i%8==0)
			1=>bassPtrn;
		else
			Math.random2(0,2)=>bassPtrn;
		if(bassPtrn==1)
		{
			sampleChord(chordDegree,chordQuality,"bass") => Std.mtof => bass.freq;
			1.0=>bass.noteOn;
		}
		else if(bassPtrn==0)
		{
			1.0=>bass.noteOff;	
		}
	
	
		quarterNote*1/4=>now;

	}
}

//play bass in eighth note
fun void walkingBass(int chordDegree,string chordQuality)
{
	int bassPtrn;
	for(0=>int i;i<8;i++)
	{
		sampleChord(chordDegree,chordQuality,"bass") => Std.mtof => bass.freq;
		1.0=>bass.noteOn;
		quarterNote*1/2*3/4=>now;
		1.0=>bass.noteOff;
		quarterNote*1/2*1/4=>now;
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
