///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* Pattern Library */

//basic concepts / terminology

p = Pseq((0..10),1)
a = p.asStream
a.next

b = p.asStream
b.next

//Pbind - pairing keys and values

TempoClock.default.tempo = 120/60

(
Pbind(
	\dur, Pseq([0.5,1],inf), //stream lasts as long as the shortest imbedded pattern
	\degree, Pseq([0,1,2],inf),
).play
)

(
Pdef(\melody,
	Pbind(
		\dur, Pseq([13/11,15/11,17/15],inf),
		\degree, Pseq((5..9),inf),
		\octave,4,
		\sustain, 0.1,
		\scale, Scale.partch_o1,
		\amp, 0.3,
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





// Links/Resources
// scsynth.org
// https://github.com/madskjeldgaard/awesome-supercollider

// Approach to using help/docuemntation?
