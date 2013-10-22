//record a corpus  
//Author:Li Xian

if(me.args()<2) {
	<<<"usage:chuck record.ck:dataname:speakername">>>;
	me.exit();
}
me.arg(0)=>string dataname;
me.arg(1)=>string speakername;
dataname+"_"+speakername=>string dir;

record();


fun void record()
{
	
	<<<"start record after 3 seconds">>>;
	now + 3::second=>time later;
	3=>int i;
	while(now<later)
	{
		<<<i>>>;
		1::second=>now;
		i--;
	}
	KBHit kb;
	-1=>int file;
	while(true)
	{
		
		file++;
		adc=>WvOut w=>blackhole;
		dir +"/" + file  +".wav"=>w.wavFilename;
		<<<"start recording",dir,file,".wav">>>;
		playNote(69,200::ms);
		kb=>now;
		while(kb.more())
		{
			kb.getchar()=>int k;
			if(k==114)
			{
				w.closeFile();
			}
			else if(k==112)
			{
				dir + "/"+ file + ".wav"=>string filename;
				w.closeFile();
				<<<"play",filename,"...">>>;
				playfile(filename);
				
				<<<"play done!">>>;
			}
			else if(k==120)
			{
				w.closeFile();
				<<<"record complete!">>>;
				me.exit();
			}
			else
			{
				<<<"press \"r\" to record ,\"p\" to play last record ,\"x\"to quit...">>>;
				kb=>now;
			}
		}
	}
}
fun void playNote(int note,dur duration)
{
	SinOsc s=>dac;
	Std.mtof(note)=>s.freq;
	duration=>now;
	s=<dac;
}
fun void playfile(string filename)
{
	WvIn w=>dac;
	filename=>w.path;
	KBHit kb;
	kb=>now;
	w=<dac;
}

