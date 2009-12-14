class WobbleInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate, gainLFO;
  AudioOutput out;
  
  WobbleInstrument(float frequency, float amplitude, float lFOFreq, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    lFOOsc = new Oscil(lFOFreq/2.0, 1.0, Waves.Sine);
    gainGate = new Gain(0);
    gainLFO = new Gain(1);
    //gainLFO.setSampleRate(out.sampleRate());
    println("WobbleInstrument: about to patch");
    //sineOsc.patch(gain.audio).patch(out);
    //gainLFO.printInputs();
    lFOOsc.patch(gainLFO.amplitude);
    //sineOsc.patch(gainGate.audio).patch(gainLFO.audio).patch(out);
    //lFOOsc.patch(sineOsc.frequencyModulation);
    sineOsc.patch(gainGate).patch(gainLFO).patch(out);
    //gainLFO.printInputs();
    //lFOOsc.patch(gain.amplitude);
    //lFOOsc.patch(gain.audio).patch(out);
    println("WobbleInstrument: patched");
  }
  
  void noteOn(float dur)
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
