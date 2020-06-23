///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* Using SynthDefs */

// Synthesis Definition

// Pdef, Tdef, Ndef, MIDIdef, OSCdef, etc.
// "recipes" for handling different types of behaviour


// sc140  - good things come in small packages

// Nathaniel Virgo
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a}.play

// Andrea Valle
{13.do{|i|k="SuperCollider"[i].ascii;20.do{|u|{MoogFF.ar(Saw.ar((k/4).midicps)*EnvGen.ar(Env.perc),u+k*9,k/30)}.play;(k*0.001).wait}}}.fork


// I won't bother too much with DSP or synthesis theory as there are lots of great resources that explain those things better than I


~buffer = Buffer.read(s,"/Users/mikemccormick/Desktop/drop.aif")


(
SynthDef(\playback,{
	arg bufnum,rate=1,pan=0,amp=0.5,outBus=0;
	var sig;

	sig = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum)*rate,loop:1);
	sig = Pan2.ar(sig,pan,amp);
	Out.ar(outBus,sig);

}).add
)

Synth(\playback)
Synth(\playback,[\bufnum, ~buffer,\rate,0.5.rrand(2.0),\amp,])


Get into Ndefs?



/* relevant help files */

// SynthDef
// Synth
// UGen