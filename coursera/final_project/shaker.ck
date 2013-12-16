Shakers shaker => dac;
6 => shaker.preset; 

BPM bpm;
bpm.tempo(120);

spork ~markovShaker();
while(true)
{
	1::second => now;
}


fun void markovShaker()
{
	0 => int preState;
	while(true)
	{
		if(preState == 0)
		{
			if(Math.randomf()<0.5)
				BPM.thirtysecondNote/2 => now;
			else
			{
				1 => preState;
				1.0=>shaker.noteOn;
				BPM.thirtysecondNote/2 => now;
			}
		}

		else
		{
			if(Math.randomf()<0.5)
			{
				1.0 => shaker.noteOn;
				BPM.thirtysecondNote/2 => now;
			}
			else
			{
				0 => preState;
				BPM.thirtysecondNote/2 => now;
			}

				
		}
	}
}

