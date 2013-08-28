// trumpet example
// author: Perry Cook
SinOsc m => ADSR menv => SinOsc c => ADSR cenv => dac;

// vibrato
SinOsc v => m; v => c;
10.5 => v.freq; 1 => v.gain;
// set up to do FM synthesis
2 => m.sync; 2 => c.sync; 
// set envelopes
menv.set( 75::ms, 100::ms, 0.9, 250::ms );
cenv.set( 50::ms, 100::ms, 1.0, 350::ms );
// modulation amount controls brightness
1200.0 => m.gain; 

// play some test tones
playnote( 57, 1.2::second );
playnote( 64, 1.2::second );
playnote( 69, 1.2::second );
// increase vibrato for last note
10 => v.gain;                    
playnote( 81, 1.5::second );

// play a note
fun void playnote( float pitch, dur duration )
{
    // only change freq on noteOn
    pitch => Std.mtof => c.freq;
    // set ratio
    c.freq()*1.005 => m.freq;
    
    // open
    menv.keyOn(); cenv.keyOn();
    // wait
    duration - cenv.releaseTime() => now;
    // release
    menv.keyOff(); cenv.keyOff();
    // wait for release
    cenv.releaseTime() => now;
}

