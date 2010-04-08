class GrabularInstrument implements Instrument
{
  Oscil toneOsc;
  Line freqLine;
  GranulateRandom chopper;
  
  GrabularInstrument( float amplitude, float begFreq, float endFreq )
  {

    toneOsc = new Oscil( begFreq, amplitude, Waves.TRIANGLE);
    chopper = new GranulateRandom( 0.005, 0.005, 0.001, 0.020, 0.020, 0.002 );
    freqLine = new Line( 2.6, begFreq, endFreq );

    freqLine.patch( toneOsc.frequency );
    toneOsc.patch( chopper );
  }
  
  void noteOn( float dur )
  {
    
    freqLine.setLineTime( dur - 1.0 );
    freqLine.activate();
    chopper.patch( out );
  }
  
  void noteOff()
  {
    chopper.unpatch( out );
  }
}
