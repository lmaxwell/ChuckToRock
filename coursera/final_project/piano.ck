// piano.ck
// 
//
SongInfo.scale @=> int scale[];
BPM.quarterNote => dur quarterNote;





Rhodey chord[3];
Pan2 pan[3];
JCRev reverb =>  dac;
0.1=>reverb.mix;
for(0=>int i; i<3;i++)
{
	chord[i]=>pan[i]=>dac;
	0.4=>chord[i].gain;
}


0=>int count;
while(count<4)
{
	playChord(1,"minor",0.6);
	quarterNote*2 => now;
	playChord(1,"minor",0.6);
	quarterNote*2 => now;

	playChord(6,"major",0.6);
	quarterNote*2 => now;
	playChord(6,"major",0.6);
	quarterNote*2 => now;
	count++;
}

	playChord(1,"minor",0.6);
	quarterNote*1 => now;
	playChord(1,"minor",0.6);
	quarterNote*1 => now;
	playChord(1,"minor",0.6);
	quarterNote*1 => now;
	playChord(1,"minor",0.6);
	quarterNote*1 => now;
	
	playChord(6,"major",0.6);
	quarterNote*1 => now;
	playChord(6,"major",0.6);
	quarterNote*1 => now;
	
	playChord(6,"major",0.6);
	quarterNote*1 => now;
	playChord(6,"major",0.6);
	quarterNote*1 => now;

	playChord(4,"minor",0.6);
	quarterNote*1 => now;
	playChord(4,"minor",0.6);
	quarterNote*1 => now;
	playChord(5,"minor",0.6);
	quarterNote*1 => now;

	playChord(5,"minor",0.6);
	quarterNote*1 => now;
playChord(1,"minor",0.8);
quarterNote*4=>now;


//play Chord
fun void playChord(int degree,string quality,float gain)
{
	for(0=>int i;i<3;i++)
	{
		1.0 => chord[i].noteOn;
		Math.random2f(-0.8,0.8)=>pan[i].pan;
		gain/3 => chord[i].gain;
	}
	scale[degree-1] => Std.mtof => chord[0].freq;
	if (quality == "major")
		scale[degree-1] + 4=> Std.mtof => chord[1].freq;
	else
		scale[degree-1] + 3 + Math.random2(-1,2)*12=> Std.mtof => chord[1].freq;
	scale[degree-1] + 7 + Math.random2(-1,2)*12=> Std.mtof => chord[2].freq;

}


