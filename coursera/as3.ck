//random select kick, snare, and stereo_fx 
//using a fibonacci sequence to construct a repeated melody


Gain master => dac;
SndBuf kick[5];
SndBuf snare[5];
SndBuf clap;
SndBuf hihat;
SndBuf2 stereo[5];
SinOsc sin => Pan2 sinPan => master;
0.5 => sin.gain;
0.5 => master.gain;
[50,52,53,55,57,59,60,62] @=> int D_Dorian[]; //dorian scale

//read kick
for (0=>int i;i<5;i++)
{
	kick[i]=>dac;
	"audio/kick_0"+Std.itoa(i+1)+".wav" => kick[i].read;
	kick[i].samples() => kick[i].pos;
}
//read snare
for (0=>int i;i<3;i++)
{
	snare[i]=>dac;
	"audio/snare_0"+Std.itoa(i+1)+".wav" => snare[i].read;
	snare[i].samples() => snare[i].pos;
}
//read clap
clap =>Pan2 clapPan => master;
"audio/clap_01.wav"=>clap.read;
clap.samples() => clap.pos;

//read hihat
hihat => Pan2 hihatPan => master;
"audio/hihat_03.wav" => hihat.read;
hihat.samples() => hihat.pos;

//read stereo fx
for (0=>int i;i<5;i++)
{
	stereo[i]=> dac;
	"audio/stereo_fx_0"+Std.itoa(i+1)+".wav" => stereo[i].read;	
	stereo[i].samples() => stereo[i].pos;
}

//exit;

0 => int beat;
0 => int i;
1 => int j;
while(true)
{
	
	if(beat % 8 ==0 || beat %8 ==4) //beat 1 or 3
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
	if(beat % 8 == 2|| beat %8 ==6) // beat 2 or 4
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
		0 => clap.pos;
	}
	if(beat % 24 ==0)
	{
		Math.random2(0,4) => int which;
		Math.random2f(1,1) => float rate => stereo[which].rate;
		if(rate >= 0)
			0 => stereo[which].pos;
		else
		{
			//<<<"reverse">>>;
			stereo[which].samples() => stereo[which].pos;
		}
		0 => hihat.pos;
		Math.random2f(-1,1) => hihatPan.pan;
	}
	
	Math.random2f(-1,1) => sinPan.pan ;
	Math.random2f(-1,1) => clapPan.pan ;
	(i + j)%8 => int k; //fibonacci sequence
	D_Dorian[k] + Math.random2(-1,1)*12=> Std.mtof => sin.freq;
	0.25::second => now;
	beat++;
	j => i;
	k => j;
}
