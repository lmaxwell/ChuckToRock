// drums.ck
// Insert the title of your piece here

// Part of your composition goes here

Mix2 mix =>  JCRev reverb => dac;
0.04 => reverb.mix;
0.95 => reverb.gain;
SndBuf kick => reverb;
SndBuf snare => Pan2 panSnare => reverb; 
SndBuf snare2 => Pan2 panSnare2 => reverb;
SndBuf closedHat => Pan2 panHat => dac;
SndBuf cowBell => panHat => mix;
me.dir(-1) + "/audio/kick_03.wav" => kick.read;
me.dir(-1) + "/audio/snare_01.wav" => snare.read;
me.dir(-1) + "/audio/snare_03.wav" => snare2.read;
me.dir(-1) + "/audio/hihat_02.wav" => closedHat.read;
me.dir(-1) + "/audio/cowbell_01.wav" => cowBell.read;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
snare2.samples() => snare2.pos;
closedHat.samples() => closedHat.pos;
cowBell.samples()=>cowBell.pos;
0.8=>kick.gain;
0.7=>snare.gain;
0.15=>closedHat.gain;
0.15=>cowBell.gain;
0.45=>panSnare.pan;

0.65::second => dur secondPerBeat;

[1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0] @=>int kickPtrn[];
[0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0] @=>int snarePtrn[];
[1,1,0,1,0,0,1,0,0,1,0,0,0,0,1,0] @=>int cowBellPtrn[];

now + 30::second => time later;
while(now<later-1.4::second)
{
	playDrumPattern(kickPtrn,snarePtrn);	
}

fun void playDrumPattern(int kickPtrn[],int snarePtrn[])
{
	for(0=>int count;count<kickPtrn.cap();count++)
	{
		if(kickPtrn[count])
			0=>kick.pos;
		
		if(snarePtrn[count])
			0=>snare.pos;

		if(Math.random2(0,1))
		{
			0=>closedHat.pos;
			Math.random2f(-1,-0.6) => panHat.pan; 
		}
		else if(Math.random2(0,1)==1)
		{
			0=> cowBell.pos;
			Math.random2f(0.6,1) => panHat.pan; 
		}

		secondPerBeat/4=> now;
	}
		
}
