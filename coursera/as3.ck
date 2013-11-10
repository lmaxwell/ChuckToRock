//random select kick, snare, and stereo_fx 
//using a fibonacci sequence to construct a repeated bass line & melody
//every play will generate a total diffrent sound

Gain master => dac;
SndBuf kick[5];
SndBuf snare[5];
SndBuf clap;
SndBuf hihat;
SndBuf cowbell;
SndBuf2 stereo[5];
SinOsc sin => Pan2 sinPan => master;
SqrOsc bass => master;

//setting volumn 
0.7 => sin.gain;
0.5 => master.gain;
0.5=> bass.gain;
0.5=>hihat.gain;
0.8 => clap.gain;


//read kick
for (0=>int i;i<5;i++)
{
	kick[i]=>dac;
	me.dir() +"/audio/kick_0"+Std.itoa(i+1)+".wav" => kick[i].read;
	kick[i].samples() => kick[i].pos;
	0.8=>kick[i].gain;
}
//read snare
for (0=>int i;i<3;i++)
{
	snare[i]=>dac;
	me.dir() +"/audio/snare_0"+Std.itoa(i+1)+".wav" => snare[i].read;
	snare[i].samples() => snare[i].pos;
	0.8 => snare[i].gain;
}
//read clap
clap =>Pan2 clapPan => master;
me.dir() +"/audio/clap_01.wav"=>clap.read;
clap.samples() => clap.pos;

//read hihat
hihat => Pan2 hihatPan => master;
me.dir() +"/audio/hihat_03.wav" => hihat.read;
hihat.samples() => hihat.pos;

//read cowbell
cowbell=>Pan2 cowbellPan => master;
me.dir() +"/audio/cowbell_01.wav" => cowbell.read;
cowbell.samples() => cowbell.pos;

//read stereo fx
for (0=>int i;i<5;i++)
{
	stereo[i]=> dac;
	me.dir()+ "/audio/stereo_fx_0"+Std.itoa(i+1)+".wav" => stereo[i].read;	
	stereo[i].samples() => stereo[i].pos;
}

[50,52,53,55,57,59,60,62] @=> int D_Dorian[]; //dorian scale
//exit;

0 => int beat;
0 => int i;
1 => int j;
while(beat<112)
{

	0=>bass.gain;
	(i + j)%8 => int k; //fibonacci sequence
	if(beat %120 <72) //section 1
	{
		D_Dorian[k] + Math.random2(-1,1)*12=> Std.mtof => sin.freq;
		D_Dorian[k] + Math.random2(-2,-1)*12=> Std.mtof => bass.freq;
	}
	if(beat %120 >= 72) //section 2
	{
		D_Dorian[k] + Math.random2(1,2)*12=> Std.mtof => sin.freq;
		D_Dorian[k] - 12=> Std.mtof => bass.freq;
		0=>hihat.pos; 	   
	    Math.random2f(-1,1) => hihatPan.pan;

	}
 	if(beat % 120 >72 && (beat % 8 == 2 || beat % 8 == 6 || beat %8 == 3 || beat %8 == 7) )
   {
	   0=>cowbell.pos;
   }

	if(beat % 8 ==0 || beat %8 ==4) //random select kick on beat 1 or 3
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
		0.3=>bass.gain;
	}
	if(beat % 8 == 2|| beat %8 ==6) //radom select snare, clap on beat 2 or 4
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
	if(beat % 24 ==0) //random select stereo fx every 24 beat
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
	0.25::second => now;
	beat++;
	j => i;
	k => j;
}

//ending
0=>hihat.pos;
0=>kick[0].pos;
0=>snare[0].pos;
2::second => now;
