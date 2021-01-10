//: 10 Jan 2021 16:33
/* Porting to sc-hacks

*/

//:
~uchuu = { | bufnum = 0, rate=1, shift=1.25, amp = 0.8 |
	{
	var a, b, c, d;
	a = Mix(PlayBuf.ar(2, ~buffers[bufnum], rate, loop:1));
	b = LocalIn.ar + a;		// feedback loop
	c = Limiter.ar(b);		// avoid "explosion"
	d = PitchShift.ar(b, 0.1, shift, 0, 0.01);
	LocalOut.ar(d);
		{ d * amp } ! 2;
}.play;
};
//:
~uchuu.value;
//:
\uchuu.p.setSource({ | bufnum = 0, rate=1, shift=1.25, amp = 0.8 |
	var a, b, c, d;
	a = Mix(PlayBuf.ar(2, ~buffers[bufnum], rate, loop:1));
	b = LocalIn.ar + a;		// feedback loop
	c = Limiter.ar(b);		// avoid "explosion"
	d = PitchShift.ar(b, 0.1, shift, 0, 0.01);
	LocalOut.ar(d);
		{ d * amp } ! 2;
});
//:
\uchuu.play;
//:
\test.p.setSource({ SinOsc.ar(1000, 0, 0.2).dup });
//:
\test.play;
//:
\test.pp.source;