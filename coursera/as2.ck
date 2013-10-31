Pan2  p=> Gain g=> dac;
SinOsc sin => p;
SqrOsc sqr => p;
SawOsc saw => p;

0.1 => g.gain;

[50,52,53,55,57,59,60,62] @=> int D_Dorian[]; //scale


//chord 
[0,2,4] @=> int Six[]; //6 degree
[2,4,6] @=> int Fir[]; //1 degree
[6,1,3] @=> int Fiv[]; //5 degree
[3,5,7] @=> int Sen[]; //2 degree


int i;
while(true)
{
	//first bar
	0=>i;
	while(i<4)
	{
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Six[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	i++;
	}

	//second bar
	0=>i;
	while(i<4)
	{
	D_Dorian[Sen[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Sen[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Sen[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	i++;
	}
	0=>i;
}
