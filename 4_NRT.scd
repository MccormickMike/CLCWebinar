///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* NRT / Fixed media rendering */


// can simply record in RT - show how!
​
// new pattern
(
p = Pbind(
    \dur, Prand([0.25, 0.5], inf),
    \freq, Prand([200, 300, 500],inf)
);
)

p.play
​
// make a score from the pattern, 4 beats long
z = p.asScore(4.0);
z.score.do({arg i; i.postln})


z.play;
​
// rendering a pattern to sound file directly:
​
(
x = Pbind(
    \dur, Prand([0.25, 0.5], inf),
    \freq, Prand([200, 300, 500],inf),
).asScore(10);

// we must add our synth defs as part of the score
x.add([0.0, [\d_recv, SynthDescLib.global[\default].def.asBytes]]);
x.sort;

x.recordNRT(
    outputFilePath: "~/desktop/nrt.wav".standardizePath,
    sampleRate: 44100,
    headerFormat: "WAV",
    sampleFormat: "int16",
	options: ServerOptions.new.numOutputBusChannels_(2),
	duration: 11
);
)

~nrt = Buffer.readChannel(s,,channels:[0,1])t
~nrt.play

/* relevant help files */

// Non-Realtime Synthesis (NRT)
// Score
// SoundFile lists all the Header Formats
