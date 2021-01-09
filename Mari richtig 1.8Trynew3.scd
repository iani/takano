Server.default.meter;
// 1. Vom Anfang-zum Takt 24
// x+y allmaehlich z+w

(
~mn1 = { | rate = 5, freq = 500, amp = 0.1 |
	{
		SinOsc.ar(
			LFNoise0.ar(rate, freq), 0, amp
		) ! 2
	}.play;
};
)

x = ~mn1.(5, 500, 0.1);
y = ~mn1.(10,500, 0.1);
z = ~mn1. (100,500,0.05);
w = ~mn1. (200,500,0.05);

x　release: 14;
y　release: 14;
z　release: 14;
w　release: 14;

x.free;
y.free;
z.free;
w.free;

2. Vom Takt25 zum32

(
~fs1 = { | fmin = 220, fw = 110, amp = 0.04 |
	{
		{
			Pan2.ar(
				SinOsc.ar(
					fmin + fw.rand, 0, amp
				)
			);
		}.play
	} ! 4
}
)

k = ~fs1.(200);
i = ~fs1.(660);
j=  ~fs1.(800);
k do: _.free;
i do: _.free;
j do: _.free;
k.free;
i.free;

k do: _.release(7)
i do: _.release(7)
j do: _.release(7)


3.  vom Takt 33-zum 51

~cat   = ~af1.(0);

~cat2  = ~af1.(0, 2);

~cat3  = ~af1.(rate: -1);

~cat.free;
~cat2.free;
~cat3.free;

~cat　release: 14;
~cat2 release: 14;
~cat3 release: 14;

~catvib   = ~vib.(0, amp:0.2 );
~catvib3  = ~vib.(rate: -1, amp:0.2);

~catvib.free;
~catvib3.free;

~catvib release: 14;
~catvib3  release: 14;


4. Vom Takt 52-zum Takt58

(
~mn1 = { | rate = 5, freq = 500, amp = 0.1 |
	{
		SinOsc.ar(
			LFNoise0.ar(rate, freq), 0, amp
		) ! 2
	}.play;
};
)

x = ~mn1.(5, 500, 0.2);
y = ~mn1.(10,500, 0.2);

x.free;
y.free;

x release: 14;
y release: 14;

~peb1 = Synth("peb1",[\amp, 0.3]);

~peb1.free;

~peb1 release: 14;

change,trocken


5.Vom Takt 59-zum Takt75

~peb2 = Synth("peb2", [\amp, 0.5]);

~peb2 release: 7;

~peb3 = Synth("peb3", [\amp, 0.2]);

~peb3 release: 7;

~peb2.free;
~peb3.free;

~peb4 = Synth("peb3", [\amp, 0.2]);
~peb4 release: 7;
6.Vom Takt 76-97

~cry  = ~af1.(1, amp:　0.1);

~cry2  = ~af1.(1, rate: 2, amp:　0.1);

~cry3  = ~af1.(1,rate: -1, amp:　0.1);

~cry.free;
~cry2.free;
~cry3.free;

~cry release: 7;
~cry2 release: 7;
~cry3 release: 7;

~cryvib2   = ~vib.(1, rate: 2, vibrate: 20, width: 200, amp:　0.1);

~cryuchuu2  =~uchuu.(1,2,amp:　0.1);

~cryvib2   release: 7;
~cryuchuu2 release: 7;


 7.Vom Takt 97-135

~peba = Synth("peb", [\bus, Bus.audio, \amp,0.1]);

.~pebb = Synth("peb", [\bus, Bus.audio, \amp, 0.1]);//小さくした

~pebc = Synth("peb", [\bus, Bus.audio, \noise, 100000,\amp,0.1]);

~pebd = Synth("peb", [\bus, Bus.audio,\noisep, 5500, \amp,0.1]);

~pebe = Synth("peb", [\bus, Bus.audio,\noisep, 2000, \amp,0.08]);

~pebf = Synth("peb", [\bus, Bus.audio,\noise, 100,\amp,0.2]);

~pebg = Synth("peb", [\bus, Bus.audio,\noise, 1000, \noisep, 6000,\amp,0.2]);

~peba release: 7;

~peba.free;
~pebb.free;
~pebc.free;
~pebd.free;
~pebe.free;
~pebf.free;
~pebg.free;

Server.default.options.firstPrivateBus;

a = Bus.audio;
b = Bus.audio;
c = Bus.audio;

8.Vom Takt 98-135

~fire  = ~af1.(2,amp:0.01);
~fire2  = ~af1.(2, rate: 2);
~fire3  = ~af1.(2,rate: -1);

~fire.free;
~fire2.free;
~fire3.free;

~fire release: 7;
~fire2 release: 7;
~fire3 release: 7;

// 9.Vom Takt 130-154

Vom Takt 136-154

~heart  = ~af1.(3);

~heart2  = ~af1.(3, rate: 2);

~heart3  = ~af1.(3,rate: -1);

~heart release: 7;
~heart2 release: 7;
~heart3 release: 7;

~heart.free;
~heart2.free;
~heart3.free;

Vom Takt 147-154

~tori = Synth(\tori);

~horn = Synth(\horn);

~tori release: 7;
~horn release: 7;

~jyumon = ~af1.(4);

~jyumon2  = ~af1.(4, rate: 2);

~jyumon3  = ~af1.(4,rate: -1);

~jyumonuchuu  =~uchuu.(4,amp:　0.4);

~jyumon release: 14;
~jyumon2 release: 14;
~jyumon3 release: 14;
~jyumonuchuu release: 14;

//~jyumonvib   = ~vib.(4);

~jyumon.free;
~jyumon2.free;
~jyumon3.free;


~majinai= ~af1.(5);

~majinai2  = ~af1.(5, rate: 2);

~majinai3  = ~af1.(5,rate: -1);

~majinai release: 14;
~majinai2 release: 14;
~majinai3 release: 14;

~majinai.free;
~majinai2.free;
~majinai3.free;

~shu= ~af1.(6);
~shu2  = ~af1.(6, rate: 2);
~shu3  = ~af1.(6,rate: -1);

~shu release: 14;
~shu2 release: 14;
~shu3 release: 14;

~shu.free;
~shu2.free;
~shu3.free;



