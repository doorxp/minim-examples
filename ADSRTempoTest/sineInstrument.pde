class SineInstrument implements Instrument
{
  Oscil sineOsc;
  Gain  gain;
  ADSR  adsr;
  AudioOutput out;
  
  SineInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Triangle);
    gain = new Gain(0);
    adsr = new ADSR(0.5, 0.01, 0.05, 0.5, 0.5);
    sineOsc.patch(adsr).patch(out);
  }
  
  void noteOn(float dur)
  {
    //println("Note on!");
    gain.setValue(1);
    adsr.noteOn();
  }
  
  void noteOff()
  {
    //println("Note off!");
    gain.setValue(0);
    adsr.noteOff();
  }
}
