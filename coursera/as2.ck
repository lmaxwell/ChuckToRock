Pan2  p=> Gain g=> dac;
SinOsc sin => p;
SqrOsc sqr => p;
SawOsc saw => p;


//gain
0.1 => g.gain;
0.5 => sin.gain;
0.4 => sqr.gain;
0.2 => saw.gain;


[50,52,53,55,57,59,60,62] @=> int D_Dorian[]; //scale


//chord 
[0,2,4] @=> int Six[]; //sixth degree
[2,4,6] @=> int Fir[]; //first degree
[6,1,3] @=> int Fif[]; //fifth degree
[3,5,7] @=> int Sec[]; //second degree


int beat;

1 => int secA; //section A
while(secA <= 1)
{
	//bar 1
	1=>beat;
	while(beat<=8) // 0.25 second one beat , 8 beat a bar 
	{
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Six[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	//bar 2
	1 => beat;
	while(beat <= 8)
	{
	D_Dorian[Sec[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Sec[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Sec[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	secA++;
}

1 => int secB; //section B
while(secB <=2 )
{
	//bar 1
	1=>beat;
	while(beat<=8) // 0.25 second one beat , 8 beat a bar 
	{
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Six[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	//bar 2
	1 => beat;
	while(beat <= 8)
	{
	D_Dorian[Sec[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Sec[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Sec[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	//bar 3
	1=>beat;
	while(beat<=8) // 0.25 second one beat , 8 beat a bar 
	{
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Six[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	
	//bar 4
	1=>beat;
	while(beat<=8) // 0.25 second one beat , 8 beat a bar 
	{
	D_Dorian[Fif[Math.random2(0,2)]] + 12*Math.random2(1,2) => Std.mtof =>sin.freq;
	D_Dorian[Fif[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Fif[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	secB++;
}

1 => int secC;//section C
while(secC <= 1)
{
	//bar 1
	1=>beat;
	while(beat<=8) // 0.25 second one beat , 8 beat a bar 
	{
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(2,4) => Std.mtof =>sin.freq;
	D_Dorian[Six[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(0,1) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	//bar 2
	1 => beat;
	while(beat <= 8)
	{
	D_Dorian[Fir[Math.random2(0,2)]] + 12*Math.random2(2,4) => Std.mtof =>sin.freq;
	D_Dorian[Fir[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Fir[Math.random2(0,2)]] + 12*Math.random2(0,1) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}


	
	//bar 3
	1=>beat;
	while(beat<=8) // 0.25 second one beat , 8 beat a bar 
	{
	D_Dorian[Fif[Math.random2(0,2)]] + 12*Math.random2(2,4) => Std.mtof =>sin.freq;
	D_Dorian[Fif[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Fif[Math.random2(0,2)]] + 12*Math.random2(0,1) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}
	
	//bar 4
	1 => beat;
	while(beat <= 8)
	{
	D_Dorian[Sec[Math.random2(0,2)]] + 12*Math.random2(2,4) => Std.mtof =>sin.freq;
	D_Dorian[Sec[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Sec[Math.random2(0,2)]] + 12*Math.random2(0,1) => Std.mtof =>saw.freq;
	.25::second=>now;
	Math.randomf() => p.pan;
	beat++;
	}

	//bar 6
	//1=>beat;
	//while(beat<=4) // 0.25 second one beat , 8 beat a bar 
	//{
	//D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(2,4) => Std.mtof =>sin.freq;
	//D_Dorian[Six[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	//D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(0,1) => Std.mtof =>saw.freq;
	//.25::second=>now;
	//Math.randomf() => p.pan;
	//beat++;
	//}

	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(2,4) => Std.mtof =>sin.freq;
	D_Dorian[Six[Math.random2(0,2)]]  + 12*Math.random2(-1,0)=> Std.mtof =>sqr.freq;
	D_Dorian[Six[Math.random2(0,2)]] + 12*Math.random2(0,0) => Std.mtof =>saw.freq;
	2::second=>now;
	Math.randomf() => p.pan;


	secC++;
}
