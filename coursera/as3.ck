
Gain master => dac;
SndBuf kick[5];
SndBuf snare[5];


//read kick
for (0=>int i;i<5;i++)
{
	kick[i]=>dac;
	"audio/kick_0"+Std.itoa(i+1)+".wav" => kick[i].read;
}
//read snare
for (0=>int i;i<3;i++)
{
	snare[i]=>dac;
	"audio/snare_0"+Std.itoa(i+1)+".wav" => snare[i].read;
}

0 => int beat;
while(true)
{
	
	if(beat % 4 ==0 || beat %4 ==2) //beat 1 or 3
	{
		Math.random2(0,4) => int which;
		Math.random2f(1,1) => float rate => kick[which].rate;
		if(rate >= 0)
			0 => kick[which].pos;
		else
		{
			//<<<"reverse">>>;
			kick[which].samples() => kick[which].pos;
		}
	}
	if(beat % 4 ==1 || beat %4 ==3) // beat 2 or 4
	{
		Math.random2(0,2) => int which;
		Math.random2f(-1,1.5) => float rate => snare[which].rate;
		if(rate >= 0)
			0 => snare[which].pos;
		else
		{
			//<<<"reverse">>>;
			snare[which].samples() => snare[which].pos;
		}
	}

	0.25::second => now;
	beat++;
}
