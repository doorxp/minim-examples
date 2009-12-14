class SineInstrument implements Instrument
{
  Oscil sineOsc;
  Gain  gain;
  AudioOutput out;
  
  SineInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    gain = new Gain(0);
    sineOsc.patch(gain).patch(out);
  }
  
  void noteOn(float dur)
  {
    //println("Note on!");
    gain.setValue(1);
  }
  
  void noteOff()
  {
    //println("Note off!");
    gain.setValue(0);
  }
}
