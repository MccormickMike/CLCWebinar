///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* Granular Synthesis (one approach) */

// segue from default instrument to granular by explaining Envelopes

Env.sine.plot
Env.perc.plot
Env.triangle.plot
Env.adsr.plot

// stereo Buffer
~violin = Buffer.readChannel(s,"/Users/mikemccormick/Documents/GitHub/CLCWebinar/violin.aiff",channels:[0])
~violin.play

(
SynthDef(\grainPlayback,{
	arg bufnum,grainDur=0.1,pos=0, rate=1,pan=0, amp=0.7,outBus=0;
	var sig,env,frames;

	env = EnvGen.kr(Env.sine(grainDur),doneAction:2);
	frames = BufFrames.kr(bufnum) - 1;

	sig = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum)*rate,startPos:frames * pos,loop:1);
	sig = Pan2.ar(sig*env,pan,amp);
	Out.ar(outBus,sig);
}).add;
)

Synth(\grainPlayback,[\bufnum,~violin,\grainDur,0.5,\pos,0.5,])

(
Pdef(\grainer,
	Pbind(
		\instrument, \grainPlayback,
		\dur, Pseq([0.125]/2,inf),
		\bufnum,~violin,
		\grainDur,0.4,
		\pos, Pseries(0.45,0.0001,inf) + Pwhite(0.001,0.003,inf),
		\rate, 1,
		\amp,0.3,
		\pan, Pseg([-1.0,1.0,-1.0],10,'lin',inf),
	)
).play
)


Pdef(\grainer).stop
Pdef(\grainer).fadeTime = 6



/* relevant helpfiles */

// run this line
Quarks.gui
// search for the miSCellaneous_lib from Daniel Meyer and click install
// then recompile class library (under the language menu)
// you'll now have a whole collection of very interesting classes for patterns, interfaces, and granulation
// and also a few nicely written tutorials about granulation:
// Buffer Granulation
// Live Granulation

/* Granular UGens */
GrainBuf // Granular synthesis with sound stored in a buffer
GrainFM // Granular synthesis with frequency modulated sine tones
GrainIn // Granulate an input signal
GrainSin // Granular synthesis with sine tones
TGrains // Buffer granulator.
Warp1 // Warp a buffer with a time pointer