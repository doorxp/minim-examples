class FollowInstrument implements Instrument
{
  Oscil sineOsc;
  Line freqLine;
  ADSR adsr;
  
  AudioOutput out;
  float offset;
  
  FollowInstrument( float amplitude, float frequency, float offset, float alignDelay, AudioOutput out )
  {
    this.out = out;
    this.offset = offset;
    
    frequency *= 2.0;

    sineOsc = new Oscil( frequency, amplitude, Waves.Sine );
    adsr = new ADSR( 1.0, 0.1, 0.1, 1.0, 0.1 );
    freqLine = new Line( alignDelay, frequency, frequency );

    freqLine.patch( sineOsc.frequency );
    sineOsc.patch( adsr );
  }
  
  void noteOn(float dur)
  {
    println( "Follow on!" );
    adsr.patch( out );
    adsr.noteOn();
  }
  
  void noteOff()
  {
    println("Follow off!");
    adsr.noteOff();
    adsr.unpatchAfterRelease( out );
  }
  
  void receiveNewFreq( float newFreq )
  {
    println( "Follow new freq = " + newFreq );
    freqLine.setEndAmp( 0.5*newFreq + offset );
    freqLine.activate();
  }
}
