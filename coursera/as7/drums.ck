// drums.ck


Mix2 mix =>  JCRev reverb => dac;
0.04 => reverb.mix;
1.0 => reverb.gain;
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
1.0=>panHat.pan;
BPM bpm;
bpm.tempo(SongInfo.tempo);
bpm.quarterNote =>dur quarterNote;

spork ~hihat() ;//=> Shred @ shihat;
spork ~roll1();
spork ~roll2();


quarterNote*8 => now;

0=>int count;
while(count<18)
{
	0=>kick.pos;
	quarterNote=>now;
	0=>snare.pos;
	quarterNote=>now;
	count++;
}

drumRoll2(snare.samples());

fun void hihat()
{
	while(true)
	{
		0=>closedHat.pos;
		bpm.thirtysecondNote/2*Math.random2(1,40) =>now;
	}
}


fun void roll1()
{
	while(true)
	{

		bpm.quarterNote*3.5 =>now;
		Math.random2(5,20) => int index;
		drumRoll(index);
		bpm.quarterNote*0.5-((1+index)*index/2.0)::ms=>now;
		
	}
}

fun void roll2()
{
	while(true)
	{
		bpm.quarterNote*4 => now;
		drumRoll2(Math.random2(1000,3000));
	}
}

fun void drumRoll(int index)
{
	<<<"roll:",index>>>;
	if(index<1)
		return;
	else 
	{
		0=>closedHat.pos;
		//(snare.samples()-index)::samp=>now;
		index::ms=>now;
		drumRoll(index-1);
	}
}

fun void drumRoll2(int index)
{
	<<<"roll:",index>>>;
	if(index<1)
		return;
	else 
	{
		index=>snare.pos;
		//(snare.samples()-index)::samp=>now;
		(snare.samples()-index)::samp=>now;
		drumRoll2(index-1000);
	}
}
