
Server.default doWhenBooted: {
	var buffers;
	buffers = "D:/Audiofile/*".pathMatch.collect({ | path |
		Buffer.read(Server.default, path)
	}).postln;
	~buffers = buffers;
	~buffers do: { | buffer, i |
		currentEnvironment.put(
			format("sound%", i + 1).asSymbol,
			buffer
		)
	};

	//ガラスみたいできれい。ソロのところに？どうやったらテンポおとせる？
SynthDef("peb", { | bus = 50 |
Mix.fill(8, {
var fb, env, fq, osc;
 fb = (LFSaw.ar(
				Latch.ar(
					WhiteNoise.ar(0.5).abs
					+ 0.5,
					InFeedback.ar(bus,1)),1)+0.999)/2;
			Out.ar(bus, fb);
			env = 1-fb;
			fq = Latch.ar(WhiteNoise.ar(
				\noise.kr(1000))
			+ \noisep.kr(6000), fb);
osc = SinOsc.ar(SinOsc.ar(fq*5/3,0,env**2*10000,fq),0,LPF.ar(env,100));
			Out.ar(0,
				\amp.kr(1)
				* Pan2.ar(osc,Latch.ar(WhiteNoise.ar(1),fb),0.05)
				* Env.adsr(sustainLevel: 1.0).kr(doneAction: 2,
					gate: \gate.kr(1)
				)

		)})
};).load;

	SynthDef("pebb", { | bus = 50 |
Mix.fill(8, {
var fb, env, fq, osc;
 fb = (LFSaw.ar(
				Latch.ar(
					WhiteNoise.ar(0.5).abs
					+ 0.5,
					InFeedback.ar(bus,1)),1)+0.999)/2;
			Out.ar(bus, fb);
			env = 1-fb;
			fq = Latch.ar(WhiteNoise.ar(
				\noise.kr(1000))
			+ \noisep.kr(6000), fb);
osc = SinOsc.ar(SinOsc.ar(fq*5/3,0,env**2*10000,fq),0,LPF.ar(env,100));
			Out.ar(0, \amp.kr(1)*Pan2.ar(osc,Latch.ar(WhiteNoise.ar(1),fb),0.05))})
};).load;


	SynthDef("peb1", {
		var env;
		env = Env.adsr;
		Out.ar(0,
			\amp.kr(1) *
			EnvGen.kr(env, \gate.kr(1), doneAction: 2) *
			Pan2.ar(
				SinOsc.ar(
					Resonz.ar(
						StandardL.ar(
							SampleRate.ir/50, 1),2000,0.1)*4000)
				, \pos.kr(0), \level.kr(1)))
	};

	).load;

	SynthDef("peb2", {
		var aa, env;
		aa = 4/3;
		env = Env.adsr;
		Out.ar(0,
			\amp.kr(1) *
			EnvGen.kr(env, \gate.kr(1), doneAction: 2) *
			Pan2.ar(
			Mix.fill(4, {
				LPF.ar(Resonz.ar(WhiteNoise.ar(1)
					**1,aa
					**Rand(0,20).ceil*50,0.01,10),200,1)
	}),0))};).load;

	SynthDef("peb3", {
		var aa, env;
		env = Env.adsr;

		aa = 4/3;
		Out.ar(0,
			\amp.kr(1) *
			EnvGen.kr(env, \gate.kr(1), doneAction: 2) *
			Pan2.ar(
			Mix.fill(8, {
				LPF.ar(
					Resonz.ar(WhiteNoise.ar(1)
						**1,aa
						**Rand(0,20).ceil
						*50,0.01,10),300,1
				)
		}),0))
	};

	).load;





	SynthDef("peb4", {
		var aa, env;
		aa = 4/3;
		env = Env.adsr;
		Out.ar(0,
			\amp.kr(1) *
			EnvGen.kr(env, \gate.kr(1), doneAction: 2) *
			Pan2.ar(
			Mix.fill(4, {
				LPF.ar(Resonz.ar(WhiteNoise.ar(1)
					**1,aa
					**Rand(0,20).ceil*50,0.01,10),400,1)
	}),0))};).load;

//: Deconstructed synthdef into 3 separate SynthDefs
// 11 Sep 2020 16:18

//:
SynthDef("tori", {	| out = 0, gate = 1, amp = 1, pos = 0 |
	var env, p1, p2, i1, v2, i2, mxa;

	env = Env.adsr;

	// ================ TORI
	p1 = SinOsc.ar(0.073,0,0.4,0.6);
	p2 = SinOsc.ar(0.091,0,0.4,0.6);
	i1 = Resonz.ar(WhiteNoise.ar(1)**50000,
		LPF.ar(Latch.ar(WhiteNoise.ar(3000).abs,
			Dust.ar(1)),1.7)+5000,0.02,300)*SinOsc.ar(10000);

	v2 = Decay.ar(Dust.ar(1),0.05);
	i2 = SinOsc.ar(v2*5000
		+Latch.ar(WhiteNoise.ar(1000).abs,v2)+4000,0,LPF.ar(v2,100))*2;
	mxa = Pan2.ar(i1*p1 + i2*(1-p1), pos, amp);

	Out.ar(out, mxa * EnvGen.kr(env, gate, doneAction: Done.freeSelf))
}).load;

SynthDef("horn", { | out = 0, gate = 1, density = 0.2, amp = 1, pos = 0 |
	var env, v3a, v3b, mxb;

	env = Env.adsr;
	v3a = SinOsc.ar(SinOsc.ar(
		SinOsc.ar(0.07,0,10)+350,0,LPF.ar(Latch.ar(
			WhiteNoise.ar(1)**2,LFSaw.ar(20)),10)*2000)+300,
		0,Decay2.ar(Dust2.ar(density),1,4)**2);
	v3b = SinOsc.ar(SinOsc.ar(
		SinOsc.ar(0.08,0,10)+350,0,LPF.ar(Latch.ar(
			WhiteNoise.ar(1)**2,LFSaw.ar(20)),10)*2000)+280,
		0,Decay2.ar(Dust2.ar(density),1,4)**2);
	mxb  = Pan2.ar(LPF.ar((v3a+v3b).clip2(0.2),300)*4,
		pos,
		amp,
	);
	Out.ar(out, mxb * EnvGen.kr(env, gate, doneAction: Done.freeSelf))
}).load;

//:
SynthDef("suna", {	 | out = 0, gate = 1, amp = 1, pos = 0 |
	var env, v3a, v3b, mxb;
	env = Env.adsr;
	mxb = Pan2.ar(
		(HPF.ar(WhiteNoise.ar(1),9000)** SinOsc.ar(0.07,0,2,12)) / 50,
		pos,
		amp
	);
	Out.ar(0,
		EnvGen.kr(env, gate, doneAction: Done.freeSelf)
		* mxb
	);
}).load;
};
//:



~af1 = { | bufnum = 0, rate = 1, amp = 0.2 |
	{ | myamp = 0.2 |
		myamp * PlayBuf.ar(2, ~buffers[bufnum],
		\rate.kr(rate),
			Changed.kr(\trig.kr(1)),
			\pos.kr(0) *
			BufSampleRate.kr(~buffers[bufnum]),
			loop: 1
		)
	}.play(args: [myamp: amp]);
};

~vib = { | buf = 0, rate = 1, vibrate = 10, width = 100, amp = 1 |
	{
	var dur, osc, pha, wav, pan;
		buf =  ~buffers[buf];
	dur = BufFrames.ir(buf);
	osc = SinOsc.ar(vibrate, 0, width);	// vibrato
	pha = Phasor.ar(0, rate, 0, dur);
	wav = BufRd.ar(2, buf, pha + osc) * amp;
	}.play;
};

//{ "testing".postln } ! 50;

~uchuu = { | bufnum = 0, rate=1, shift=1.25, amp = 1 |
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

Server.default.boot;


