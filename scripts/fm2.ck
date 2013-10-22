// modulator, carrier, demon bunny filter!
SinOsc m =>ADSR menv => SqrOsc c => ADSR cenv => JCRev r => dac;
LPF f => HPF g ;
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


cenv.set(t.s,t.h,0.7,t.q);
menv.set(t.q,t.q,1.0,t.q);

// go 
while( true )
{
    // be careful: invalid filter params can blow up!
    c.freq()*1.5 + c.freq()*
        Math.sin( now/second ) => f.freq;
	// <<<f.freq()>>>;
    // set high pass cutoff
    f.freq() /2=> g.freq;

    // set resonances on low and high pass
    4 => f.Q;
    2 => g.Q;
    cenv.keyOn();
	menv.keyOn();
    // time step
    t.w*5 -cenv.releaseTime()=> now;
	cenv.keyOff();
	menv.keyOff();
	cenv.releaseTime()=>now;
}

