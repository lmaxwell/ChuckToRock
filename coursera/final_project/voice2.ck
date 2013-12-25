FMVoices voice => dac;
0.5 => voice.vowel;

while(true)
{
	1.0=> voice.noteOn;
	1::second => now;
	0.5 => voice.noteOff;
}
