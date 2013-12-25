VoicForm voicea => Echo delay => JCRev revl => Pan2 pan => dac;
delay => Echo delay2 =>JCRev revr =>  Pan2 panD=> dac;

0.04=>revl.mix;
0.04=>revr.mix;
BPM.quarterNote => dur quarterNote;
quarterNote/2 => delay.max;
quarterNote/4 => delay.delay;
0.8=>delay.mix;
1.2 => voicea.gain;

quarterNote => delay2.max;
quarterNote/4 => delay2.delay;
0.8=>delay2.mix;

spork ~run();

[49,51,53,56,58] @=> int scale[];
0=>int count;
int rplay;
float prefreq;
while(true)
{
	count => voicea.phonemeNum;
	0 => voicea.phonemeNum;
	voicea.freq() => prefreq;
	scale[Math.random2(0,4)] => Std.mtof => voicea.freq;
	Math.randomf() => voicea.voiceMix;
	Math.random2(0,3) => rplay;
	if(rplay==0)  //note on
		1.0 => voicea.noteOn;	
	else if(rplay==1)  //note off
		1.0=> voicea.noteOff;
	else if(rplay ==2)  //slide
		spork ~slide(prefreq,voicea.freq());


	quarterNote => now;
	count +1 => count;
}

fun void slide(float pre,float cur)
{
	(cur-pre)*0.01=>float step;
    while(pre<cur-1)
	{
		pre+ step => pre => voicea.freq;
		//<<<pre,cur>>>;
		quarterNote/150=>now;
	}
}
fun void run()
{
	0 => int count;
	while(true)
	{
		-1-Math.sin(count*3.14159/120)=>panD.pan;
		Math.sin(count*3.14159/120)=>pan.pan;
		1::ms=>now;
		(count + 1)%120 => count; 
	}
}

