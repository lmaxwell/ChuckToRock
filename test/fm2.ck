// modulator, carrier, demon bunny filter!
SinOsc m => SawOsc c => LPF f => HPF g => JCRev r => dac;
// gain
.1 => r.gain;
// reverb mix
.05 => r.mix;

// sync for FM synthesis
2 => c.sync;

// carrier freq
150 => Std.mtof => c.freq;
// modulator freq
220 => m.freq;
// index of modulation
2 => m.gain;

// go 
while( true )
{
    // be careful: invalid filter params can blow up!
    c.freq()*0.5 + c.freq()*
        Math.sin( now/second*1.3 ) => f.freq;
	<<<f.freq()>>>;
    // set high pass cutoff
    f.freq() / 2=> g.freq;

    // set resonances on low and high pass
    4 => f.Q;
    2 => g.Q;
    
    // time step
    5::ms => now;
}

