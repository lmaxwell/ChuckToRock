public class Chord 
{
	int scale[];
	int degree;
	string quality;
	
	fun void set(int _scale[],int _degree,string _quality)
	{
		setScale(_scale);
		_degree=>this.degree;
		_quality => this.quality;
	}

	fun void setScale(int _scale[])
	{
		_scale @=> this.scale;	
	}
	

	fun int sampleChord()
	{
		int chordNotes[];
		if(quality=="major" || quality=="minor")
		{
			[getRoot(),getThird(),getFifth()] @=> chordNotes;
			return chordNotes[Math.random2(0,2)] + Math.random2(1,2)*12 ;
		}
		else
		{
				
			[getRoot(),getThird(),getFifth(),getSeventh()] @=> chordNotes;
			return chordNotes[Math.random2(0,3)] ;
		}
	}
	
	fun int getRoot()
	{
		return scale[degree-1];	
	}

	fun int getThird()
	{
		if(quality == "major" || quality=="major7" || quality=="dom7")
			return getRoot()+4;
		else 
			return getRoot()+3;
	}

	fun int getFifth()
	{
		return getRoot()+7;
	}

	fun int getSeventh()
	{

		if(quality=="minor7" || quality=="dom7")
			return getRoot()+10;
		else 
			return getRoot()+11;
	}
}


