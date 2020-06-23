///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* Granular Synthesis (one approach) */





// Pdef w/ Buffer SynthDef

// segue from default instrument to granular by explaining Envelopes

Env.sine.plot
Env.perc.plot
Env.triangle.plot
Env.adsr.plot

~voiceBuffer?

(
SynthDef(\grainPlayback,{
	arg bufnum,grainDur=0.1,pos=0, rate=1,pan=0, amp=0.7,outBus=0;
	var sig,env,frames;

	env = EnvGen.kr(Env.sine(grainDur),doneAction:2);
	frames = BufFrames.kr(bufnum) - 1;

	sig = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum)*rate,startPos:frames * pos);
	sig = Pan2.ar(sig*env,pan,amp);
	Out.ar(outBus,sig);
}).add;
)

Synth(\grainPlayback,[\bufnum,~buffer,\grainDur,,\pos,0,])

// Tbilisi lesson 3 for .do granular functions



/* relevant helpfiles */

// run this line
Quarks.gui
// search for the miSCellaneous_lib from Daniel Meyer and click install
// then recompile class library (under the language menu)
// you'll now have a whole collection of very interesting classes for patterns, interfaces, and granulation
// and also a few nicely written tutorials about granulation:
// Buffer Granulation
// Live Granulation

GrainBuf // Granular synthesis with sound stored in a buffer
GrainFM // Granular synthesis with frequency modulated sine tones
GrainIn // Granulate an input signal
GrainSin // Granular synthesis with sine tones
TGrains // Buffer granulator.
Warp1 // Warp a buffer with a time pointer