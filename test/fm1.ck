SinOsc carrier => dac;
SinOsc modulator => blackhole;

// carrier freq
55 => float cf;
// modulator freq
225 => float mf;
// index of modulation
2 => float index;

// set the modulator freq
mf => modulator.freq;

// time loop
while( true )
{
    // modulate
    cf + (index*modulator.last()) => carrier.freq;
    // advance time
    1::samp => now;
}

