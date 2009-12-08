class WhiteNoiseInstrument implements Instrument
{
  Noise myNoise;
  Gain  gain;
  AudioOutput out;
  
  WhiteNoiseInstrument(float amplitude, AudioOutput output)
  {
    out = output;
    myNoise = new Noise(amplitude, Noise.Tint.WHITE);
    gain = new Gain(0);
    myNoise.patch(gain).patch(out);
  }
  
  void noteOn()
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
