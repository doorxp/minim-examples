class CrushInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  BitCrush bitCrush;
  AudioOutput out;
  
  CrushInstrument(float frequency, float amplitude, float bitRes, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    bitCrush = new BitCrush(bitRes);
    gainGate = new Gain(0);

    println("CrushInstrument: about to patch");
    sineOsc.patch(bitCrush).patch(gainGate).patch(out);
    //sineOsc.patch(gainGate).patch(out);
    println("CrushInstrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Crush on!");
    gainGate.setValue(0.5);
  }
  
  void noteOff()
  {
    println("Crush off!");
    gainGate.setValue(0);
  }
}
