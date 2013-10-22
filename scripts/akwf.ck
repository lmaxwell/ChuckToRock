
SndBuf akwf;
"../lick-master/samples/AKWF/AKWF_birds/AKWF_birds_0004.wav" => akwf.read;
akwf.loop(true);
akwf.rate(0.50);

TimeSignature.common(96) @=> TimeSignature t;
akwf=>ADSR adsr=>dac;
adsr.set(t.s,t.h,0.8,t.q);


261.6246 => float c;
440.0 => float a;
Chords.majorTriad(c, "C") @=> Chord c_maj;
Chords.minorThirteenth(a, "A") @=> Chord a_min13;
Scales.minorBlues(a,"A") @=> Scale m_blues;
t.h=>dur d;
while (true)
{
//  c_maj.sample()=>akwf.freq;	
//  adsr.keyOn(1);
//  t.e=>now;
//  adsr.keyOff(1);	
//  d-t.e=>now;
//  a_min13.sample()=>akwf.freq;	
//  adsr.keyOn(1);
//  t.e=>now;
//  adsr.keyOff(1);	
//  d-t.e=>now;
  m_blues.sample()=>akwf.freq;	
  adsr.keyOn(1);
  t.e=>now;
  adsr.keyOff(1);	
  d-t.e=>now;

}
