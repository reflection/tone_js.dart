@JS('Tone')
library tone_js;

import 'package:js/js.dart';

@JS('GainNode')
class GainNode {
  external connect(p1, [p2, p3]);
  external disconnect([p1]);
}

@JS('AudioContext')
class AudioContext {
  external GainNode createGain();
}

@JS()
@anonymous
class InstrumentOptions {
  external factory InstrumentOptions({int volume});
  external int get volume;
}

@JS('Tone')
class Tone {
  external set(param, [value, rampTime]);
  external get([param]);
  external connect(p1, [p2, p3]);
  external disconnect([p1]);
  external dispose();
}

@JS()
@anonymous
class VolumeOptions {
  external factory VolumeOptions({int volume});
}

@JS()
class Param {
  external num get value;
}

@JS()
class Volume extends Tone {
  external factory Volume(
      [dynamic /* VolumeOptions or decibel value */ optionsOrValue]);

  external Param get volume;
  external rampTo(num value, num delay);
}

@JS()
@anonymous
class OscillatorOptions {
  external factory OscillatorOptions(
      {int volume, num frequency, num detune, String type});
  external Param get volume;
  external Param get frequency;
  external Param get detune;
  external String get type;
}

@JS()
class Oscillator extends Tone with OscillatorOptions {
  external Oscillator(
      [dynamic /*OscillatorOptions | num(frequency)*/ options,
      dynamic /* type */ param2]);
  external start();
  external toMaster();
}

@JS()
class Master extends Tone {
  external static Volume get volume;
}

@JS()
class Instrument extends Tone {
  external Instrument([dynamic /*InstrumentOptions */ options]);
  // note is String (C4) or num (440)
  external triggerAttackRelease(var note, String duration);
  external Param get volume;
}

@JS()
class SimpleSynth {
  external SimpleSynth();
  external Instrument toMaster();
}

@JS()
external String get version;

@JS()
external AudioContext get context;
