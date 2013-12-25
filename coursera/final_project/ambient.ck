

SqrOsc v=> SqrOsc m => SqrOsc c => ADSR cenv => LPF lpf => HPF hpf => JCRev rev=>dac;

0.18 => rev.mix;

2=> c.sync;
2=>m.sync;
0.2=> c.gain;
0.8=>dac.gain;

//(120::ms,300::ms,0.9,250::ms) => menv.set;

	
BPM.quarterNote => dur quarterNote;
(quarterNote/16,quarterNote/4,0.7,quarterNote) => cenv.set;
//c.freq()*Math.random2f(5,20)=>lpf.freq;
//c.freq()*Math.random2f(0.2,0.3)=>hpf.freq;
Chord first;
first.set(SongInfo.scale,1,"minor");
Chord sixth;
sixth.set(SongInfo.scale,6,"major");
spork ~Q();
spork ~cutFreq();
60=>m.freq;
220=>c.freq;


[first,sixth] @=> Chord chordProgression[];
0 => int count;
while(true)
{
	//Math.random2(0,100)=>Std.mtof=>m.freq;
	//Math.random2(100,300)=>c.freq;
	chordProgression[count].sampleChord()=>c.freq;
	//c.freq()-1=>m.freq;
	c.freq() * 0.8 => m.freq;
	<<<m.freq(),c.freq()>>>;
	cenv.keyOn();
	quarterNote*3=>now;
	cenv.keyOff();
	quarterNote=>now;
	(count + 1)%chordProgression.cap()=>count;
}

fun void Q()
{
	while(true)
	{
		Math.random2f(0.8,1)=>lpf.Q;	
		Math.random2f(0.3,0.5)=>hpf.Q;	
		quarterNote/12 => now;
	}

}

fun void cutFreq()
{
	while(true)
	{
		c.freq()*Math.random2f(5.0,14.0)=>lpf.freq;
		c.freq()*Math.random2f(0.1,0.2)=>hpf.freq;
		Math.random2(5,30)=>v.freq;
		quarterNote/12 => now;
	}
}
