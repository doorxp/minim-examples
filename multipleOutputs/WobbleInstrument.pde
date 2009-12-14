class WobbleInstrument implements Instrument
{
  Oscil sine1, sine2, lFO;
  Gain  gainGate1, gainGate2, gainLFO;
  AudioOutput out;
  
  WobbleInstrument(float frequency, float amplitude, float lFOFreq, AudioOutput output)
  {
    out = output;
    sine1 = new Oscil(frequency, amplitude, Waves.Sine);
    sine2 = new Oscil(frequency*2.0, 1.0, Waves.Sine);
    lFO = new Oscil(lFOFreq/2.0, 1.0, Waves.Sine);
    gainGate1 = new Gain(0);
    gainGate2 = new Gain(0);
    gainLFO = new Gain(30.0);
    println("WobbleInstrument: about to patch"); 
 
    lFO.patch(sine1.amplitude);
    lFO.patch(gainLFO).patch(sine2.frequencyModulation);
    sine1.patch(gainGate1).patch(out);
    sine2.patch(gainGate2).patch(out);
    println("WobbleInstrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("wobble on!");
    gainGate1.setValue(0.5);
    gainGate2.setValue(0.5);
  }
  
  void noteOff()
  {
    println("wobble off!");
    gainGate1.setValue(0);
    gainGate2.setValue(0);
  }
}
