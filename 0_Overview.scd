///////////////////////////////////CLC: SuperCollider////////////////////////////////////////////////

/* Overview */

/***************************************************/

// Links/Resources
// https://supercollider.github.io/
// https://github.com/madskjeldgaard/awesome-supercollider
// scsynth.org
// https://www.facebook.com/groups/supercollider/
// https://www.youtube.com/user/elifieldsteel

/***************************************************/


// IMPORTANT!!!
// ctrl + enter (cmd-return on  Mac) = evaluate/run code
// alt + period (cmd + . on Mac) = stop sound
// ?ctrl + d? (cmd + d on Mac) = help documentation


/* often-encountered characters */
// comment (can also appear as above)
() code block
{} function
[] array

130 integer
130.0 floating point
10.rand
10.rand2
20.rrand(30)
rrand(20,30)

// array manipulation/access/.do etc.
x = [0,1,2,3]
x.add(1)
x = Array.fill(8,{10.rand})
x.sort
x.scramble //there are many useful methods in the documentation (Collection, Sequencable Collection, etc.)
x[3] //indexes start from 0
x.do({arg item, index; [item,index].postln})
x.do({arg i; i=i*10; i.postln})
x.collect({arg i; i=i*10;i.postln})

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
var, arg,nil, true, false, inf

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

/* relevant help files */

// Introduction to Objects
// Syntax Shortcuts
// Keyboard Shortcuts
// Operators
// Symbolic Notations
// Control Structures

// Understanding Errors
// Debugging tips
