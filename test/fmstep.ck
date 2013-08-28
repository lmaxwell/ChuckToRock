// modulator to carrier
SinOsc m => SinOsc c => dac;
// offset (carrier frequency)
Step offset => c;

// carrier frequency
220 => offset.next;
// modulator frequency
550 => m.freq;
// index of modulation
200 => m.gain;

// time-loop
while( true ) 1::second => now;

