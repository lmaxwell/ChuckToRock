// modulator, carrier, demon bunny filter!
SawOsc m => SinOsc c => ADSR cenv => LPF f => HPF g => JCRev r => dac;
// gain
.1 => r.gain;
// reverb mix
.05 => r.mix;

// sync for FM synthesis
2 => c.sync;


TimeSignature.common(96)@=> TimeSignature t;

// carrier freq
60 => Std.mtof => c.freq;
// modulator freq
100 => m.freq;
// index of modulation
2 => m.gain;


cenv.set(t.s,t.h,0.8,t.q);
//menv.set(t.s,t.h,1.0,t.q);

// go 
while( true )
{
    // be careful: invalid filter params can blow up!
    c.freq()*1.5 + c.freq()*
        Math.sin( now/second ) => f.freq;
	// <<<f.freq()>>>;
    // set high pass cutoff
    f.freq() / 1.5=> g.freq;

    // set resonances on low and high pass
    3 => f.Q;
    2 => g.Q;
    cenv.keyOn();
    // time step
    t.w => now;
	cenv.keyOff();
	cenv.releaseTime()=>now;
}

