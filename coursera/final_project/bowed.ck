Brass bowed => dac;


while(true)
{
	1.0 => bowed.noteOn;
	<<<"note On">>>;
	1.5::second => now;
	<<<"start bowing">>>;
	//1.0 => bowed.startBlowing;

	1.51::second => now;
	1.0 => bowed.noteOff;
	1::second => now;
}
