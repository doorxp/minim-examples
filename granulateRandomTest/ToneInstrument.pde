class ToneInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate,gate2;
  AudioOutput out;
  Line freqLine;
  GranulateRandom chopper;
  
  ToneInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Triangle);
    gainGate = new Gain(0);
    gate2 = new Gain(1);
    chopper = new GranulateRandom(0.010, 0.010, 0.005, 0.050, 0.020, 0.005);
    freqLine = new Line(2.6, frequency/2.0, frequency*2.0);
    println("Instrument: about to patch");
    freqLine.patch(sineOsc.frequency);
    sineOsc.patch(gainGate).patch(chopper);
    println("Instrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Instron!");
    gainGate.setValue(1.0);
    freqLine.activate();
    chopper.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue(0);
  }
}
