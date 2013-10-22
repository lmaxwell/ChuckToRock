//signal chain
SinOsc s => Envelope e => LiSa loopme => dac;

//monitor the input as well as LiSa 
s => dac; 

//initialize SinOsc parameters 
440. => s.freq;
0.2 => s.gain;

//alloc memory
6::second => loopme.duration;

//play s for a bit
500::ms => now;

//sweep the freq for fun
Envelope pitchmod => blackhole;

//set the time to target to 2 seconds 
2::second => pitchmod.duration;

//set the initial value for the sinwave 
s.freq() => pitchmod.value;

//set the target; "pitchmod" will begin moving towards
//880 as soon as time begins to pass 
880 => pitchmod.target;

//set times for recording fade in/out and sample loop length
100::ms => dur recfadetime;
1000::ms => dur mylooplen;
recfadetime => e.duration;

//start recording input; record 1 seconds worth
loopme.record(1);

//turn in the Envelope for recording 
e.keyOn();

//calculate the time we want to record to (until before ramping down) 
now + (mylooplen - recfadetime) => time later;

//allow time to pass, recording and also updating the SinOsc frequency 
while(now < later) {

pitchmod.value() => s.freq;
10::ms => now;

}

//start ramping down 
e.keyOff();

//wait for ramp to finish, and then stop recording 
recfadetime => now;
loopme.record(0);

//at this point, we should have a nice enveloped sample
//of the gliss in the LiSa internal buffer

//disconnect the SinOsc so we don't have to hear it
//and hangout a bit before playing back.... 
s =< dac;
1000::ms => now;

//now, manipulate the sample
//get an available voicenumber;
//note that this voice won't actually be reserved until you play it
loopme.getVoice() => int voice1;

//we'll play voice 1 forward, and then 
//crossfade it with voice 2 backwards 
loopme.play(voice1, 1);
(mylooplen - recfadetime) => now;

//just as voice 1 is going to fade, bring in voice 2 backwards 
loopme.getVoice() => int voice2;
loopme.rate(voice2, -1.);

//note that we need to set the playback position 
loopme.playPos(voice2, mylooplen); 

//make it a little softer 
loopme.voiceGain(voice2, 0.2);

//begin playing voice 2; helps us hear when voice 2 comes in 
loopme.play(voice2, 1);

//wait until voice 1 had finished fading, then turn off
recfadetime => now;
loopme.play(voice1, 0);

//wait for voice 2 to finish
1000::ms => now;

