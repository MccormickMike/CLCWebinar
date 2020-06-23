///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* Overview */

// Should these be different tabs for clarity's sake? all uploaded to a github repo

// Basics: Language? Math? DSP? OOP?

// a bit about me and how I learned SC,
// state intentions - this 90 minutes is to show some of the potential of SC to inspire you to work on your own!
// I may move fast, but everything I write here will be available on GitHu
// nobody will learn this language in 90 minutes, but
// if you plan on coding along, you may want to bring the master volume down (lower corner) so that you can hear what I'm saying


// IMPORTANT!!!
// ctrl + enter (cmd-return on  Mac) = evaluate/run code
// alt + period (cmd + . on Mac) = stop sound
// ?ctrl + d? (cmd + d on Mac) = help documentation


/* often-encountered characters */
// comment (can also appear as above)
() = code block
{} = function
[] = array

130 = integer
130.0 = floating point
10.rand
10.rand2
20.rrand(30)
rrand(20,30)

// add some array manipulation/access/.do etc.
[0,1,2,3]
x = []
x.add(1)
x = Array.fill(8,{10.rand})
x.sort
x.scramble
x[3]
x.do({arg item, index; item.postln; index.postln})
x.do({arg i; i=i*10; i.postln})
x.collect({arg i; i=i*10;})


'symbol'
\symbol // a name for something

"string" // also a name for something...

// difference between symbol and string
\symbol === \symbol
"string" === "string"

a..z (no s) // global variable
~result // environment variable
var local // local variable

// words that cannot be used as variables
nil, true, false, inf

UGen.method // ugens could be oscillators, noise generators, filters, envelop generators, etc.

// a quick note about .ar, .kr, .ir, also mul/add

{SinOsc.ar(20)}.plot(0.1)


// functions
(
x = {
	arg input;
	var result;

	result = input.squared + 1;
	10;
	result; // comment this to show last object returned
}
)

x.value(1);

/* important pages in Help Documents */

// Introduction to Objects
// Syntax Shortcuts
// Keyboard Shortcuts
// Operators
// Symbolic Notations
// Control Structures

// Understanding Errors
// Debugging tips
