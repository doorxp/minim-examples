class ToneInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  AudioOutput out;
  
  ToneInstrument(String note, float amplitude, AudioOutput output)
  {
    out = output;
    float frequency = Frequency.ofPitch( note ).asHz();
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    gainGate = new Gain(0);
    println("Instrument: about to patch");
    sineOsc.patch(gainGate);
    println("Instrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Instron!");
    gainGate.setValue(1.0);
    gainGate.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue(0);
  }
}