0=>int device;
if(me.args()) me.arg(0)=>Std.atoi=>device;
MidiIn min;
min.open(device);
MidiMsg msg;
Event off;
while(10::ms=>now)
{
	min=>now;
	while(min.recv(msg))
	{
		<<<msg.data1,msg.data2,msg.data3>>>;
		if(msg.data1==144) 
		{
			spork ~playNote(msg.data2);
			me.yield();
		}

		if(msg.data1==128)
		{
			off.signal();	
		}
	}
}
fun void playNote(int note)
{
	SinOsc s=>dac;
	Std.mtof(note)=>s.freq;
	off=>now;
	s=<dac;
}

