class WobbleInstrument implements Instrument
{
  Oscil sineOsc, lFO1, lFO2, lFO3, lFO4;
  Gain  gainGate, gainLFO;
  AudioOutput out;
  
  WobbleInstrument(float frequency, float amplitude, float lFOFreq, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    lFO1 = new Oscil(lFOFreq/2.0, frequency, Waves.Sine);
    lFO2 = new Oscil(frequency/2.0, 1.0, Waves.Sine);
    lFO3 = new Oscil(frequency/3.0, 100.0, Waves.Sine);
    lFO4 = new Oscil(lFOFreq/4.0, 0.5, Waves.Sine);
    gainGate = new Gain(0);
    gainLFO = new Gain(1);
    println("WobbleInstrument: about to patch");
    lFO1.patch(sineOsc.frequency);
    lFO2.patch(sineOsc.amplitude);
    lFO3.patch(sineOsc.frequencyModulation);
    lFO4.patch(sineOsc.amplitudeModulation);
    //sineOsc.patch(gainGate).patch(out);
    //lFOOsc.patch(sineOsc.frequencyIn);
    //lFOOsc.patch(gainLFO.amplitude);
    sineOsc.patch(gainGate).patch(out);
    //sineOsc.patch(gainGate).patch(out);
    //gainLFO.printInputs();
    //lFOOsc.patch(gain.amplitude);
    //lFOOsc.patch(gain.audio).patch(out);
    println("WobbleInstrument: patched");
  }
  
  void noteOn()
  {
    println("wobble on!");
    gainGate.setValue(0.5);
  }
  
  void noteOff()
  {
    println("wobble off!");
    gainGate.setValue(0);
  }
}
