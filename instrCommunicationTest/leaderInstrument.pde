class LeaderInstrument implements Instrument
{
  Oscil sineOsc;
  ADSR  adsr;
  FollowInstrument follow;
  AudioOutput out;
  
  float frequency;
  
  LeaderInstrument( float amplitude, float frequency, FollowInstrument follow, AudioOutput out )
  {
    this.out = out;
    this.follow = follow;
    frequency *= 2.0;
    this.frequency = frequency;

    sineOsc = new Oscil( frequency, amplitude, Waves.triangle(7) );
    adsr = new ADSR( 1.0, 0.1, 0.1, 1.0, 0.1 );

    sineOsc.patch( adsr );
  }
  
  void noteOn(float dur)
  {
    println( "Lead on!" );
    adsr.patch( out );
    adsr.noteOn();
    if ( null != follow )
    {
      follow.receiveNewFreq( frequency );
    }
  }
  
  void noteOff()
  {
    println("Lead off!");
    adsr.noteOff();
    adsr.unpatchAfterRelease( out );
  }
}
