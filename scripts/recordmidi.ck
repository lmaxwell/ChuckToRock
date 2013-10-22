//recode midi 



// devices to open (try: chuck --probe)
MidiIn min[16];

// number of devices
int devices;

//midi file setup
me.arg(0) => string filename;
Std.atoi(me.arg(1)) => int key; 
Std.atof(me.arg(2))=> float tempo;
Std.atoi(me.arg(3)) => int timeSig1;
Std.atoi(me.arg(4)) => int timeSig2;

1200=> float resolution;
60.0 /tempo /resolution * 48000::samp => dur samplesPerTick;
float tick;

//output file
FileIO fout;
fout.open(filename+".rawmidi",FileIO.WRITE);

if( !fout.good() )
{
    cherr <= "can't open file for writing..." <= IO.newline();
    me.exit();
}

// write some stuff
fout <= tempo <= IO.newline();
fout <= key <= IO.newline();
fout <= timeSig1 <= "\t" <= timeSig2 <= IO.newline();

//start metronome
spork ~ metronome(tempo);

// loop
for( int i; i < min.cap(); i++ )
{
    // no print err
    min[i].printerr( 0 );

    // open the device
    if( min[i].open( i ) )
    {
        <<< "device", i, "->", min[i].name(), "->", "open: SUCCESS" >>>;
        spork ~ go( min[i], i );
        devices++;
    }
    else break;
}

// check
if( devices == 0 )
{
    <<< "um, couldn't open a single MIDI device, bailing out..." >>>;
    me.exit();
}

// infinite time loop
while( true ) 1::second => now;


// handler for one midi event
fun void go( MidiIn min, int id )
{
    // the message
    MidiMsg msg;

    // infinite event loop
    while( true )
    {
        // wait on event
        min => now;

        // print message
        while( min.recv( msg ) )
        {
			if(msg.data2 == 118)
			{
				fout.close();
				<<<"write to file:",filename>>>;
				me.exit();	
			}
            // print out midi message with id
			now/samplesPerTick => tick;
            //<<< "device", id, ":",now,samplesPerTick,tick, msg.data1, msg.data2, msg.data3 >>>;
			//<<<"midi.NoteOnEvent(tick=",tick,",channel=0,data=[",msg.data2,",",msg.data3,"])">>>;
			<<<"midi.NoteOnEvent(tick=",tick$int,",channel=0,data=[",msg.data2,",",msg.data3,"])">>>;
			fout<=tick$int<="\t"<=msg.data1<="\t"<=msg.data2<="\t"<=msg.data3<=IO.newline();
        }


    }	

}


//metronome function
fun void metronome(float tempo)
{

	//time signature
	TimeSignature.common(tempo$int) @=> TimeSignature t;
	RolandTr606 drum;
	while(true)
	{
		drum.closedHat.asIntProcedure().run(50);
		t.q=>now;
	}
}
