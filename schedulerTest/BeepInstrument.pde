class BeepInstrument implements Instrument
{
  Oscil mSine;
  AudioOutput mOut;
  
  BeepInstrument( AudioOutput out )
  {
    mOut = out;
    mSine = new Oscil(440.0, 0.5, Waves.Sine);
  }
  
  void noteOn( float dur )
  {
    //println("Note On!");
    mSine.patch(out);
  }
  
  void noteOff()
  {
    //println("Note off!");
    mSine.unpatch(out);
  }
}
