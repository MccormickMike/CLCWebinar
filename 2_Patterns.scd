///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* Pattern Library */

//basic concepts / terminology

p = Pseq((0..10),1)
a = p.asStream
a.next

b = p.asStream
b.next

// Pbind - pairing keys and values

TempoClock.default.tempo = 60/60

(
Pbind(
	\dur, Pseq([2,1],inf), //stream lasts as long as the shortest imbedded pattern
	// \degree, Pseq([0,1,2],inf),
).play
)

// Pdef - accessing the stream by reference

(
Pdef(\melody,
	Pbind(
		\dur, Pseq([0.25],inf),
		\degree, Pxrand((0..8),inf),
		\octave,4,
		\sustain, 0.1,
		\scale, Scale.choose.postln,
		\amp, 0.1,
		\pan, Pif(Pkey(\degree).even,{-1},{1}),
	)
).play
)

Pdef(\melody).quant = 4
Pdef(\melody).fadeTime = 1
Pdef(\melody).stop



/* relevant help files */

// Streams, Patterns, and Events
// Streams-Patterns-Events, A Practical Guide
// JITLib -> Patterns

// Pattern Guide 01: Introduction -> Pattern Cookbook
// Pattern Guide Cookbook 05: Using Samples - may be of some interest?

// too many interesting pattern classes to list here!

// bottom of Event helpfile has default event types