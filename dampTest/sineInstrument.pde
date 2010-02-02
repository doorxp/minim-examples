class SineInstrument implements Instrument
{
  Oscil sineOsc;
  Gain  gain;
  Damp  damp;
  AudioOutput out;
  
  SineInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil( frequency, amplitude, Waves.Sine );
    gain = new Gain( 0 );
    damp = new Damp( 0.004, 0.3 );
    sineOsc.patch( damp ).patch( out );
  }
  
  void noteOn(float dur)
  {
    //println("Note on!");
    gain.setValue( 1 );
    damp.activate();
  }
  
  void noteOff()
  {
    //println("Note off!");
    gain.setValue(0);
  }
}
