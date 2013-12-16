

SinOsc v=> SqrOsc m => TriOsc c => ADSR cenv => LPF lpf =>JCRev rleft=>dac.left;
 cenv=> HPF hpf => JCRev rright=>dac.right;
0.08 => rleft.mix;
0.05=> rright.mix;
2=> c.sync;
2=>m.sync;
0.5=>dac.gain;
20=>v.freq;
//(120::ms,300::ms,0.9,250::ms) => menv.set;
(20::ms,30::ms,0.7,1250::ms) => cenv.set;


60=>m.freq;
220=>c.freq;
while(true)
{
	//Math.random2(0,100)=>Std.mtof=>m.freq;
	Math.random2(100,300)=>c.freq;
	c.freq() * 0.9 => m.freq;
	c.freq()*1.2=>lpf.freq;
	c.freq()*0.75=>hpf.freq;
	<<<m.freq(),c.freq()>>>;
	cenv.keyOn();
	1::second=>now;
	cenv.keyOff();
	5::second=>now;
}
