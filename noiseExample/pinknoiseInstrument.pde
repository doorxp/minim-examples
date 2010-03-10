class PinkNoiseInstrument implements Instrument
{
  Noise myNoise;
  Gain  gain;
  AudioOutput out;
  
  PinkNoiseInstrument(float amplitude, AudioOutput output)
  {
    out = output;
    myNoise = new Noise(amplitude, Noise.Tint.PINK );
    gain = new Gain(0);
    myNoise.patch(gain).patch(out);
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
