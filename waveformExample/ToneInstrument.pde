class ToneInstrument implements Instrument
{
  Oscil toneOsc;
  ADSR adsr;
  Gain  gainGate;
  AudioOutput out;
  
  ToneInstrument( String note, float amplitude, Waveform wave, AudioOutput output )
  {
    out = output;
    float frequency = Frequency.ofPitch( note ).asHz();
    //println( note +  " " + frequency );
    
    toneOsc = new Oscil( frequency, amplitude, wave );
    gainGate = new Gain( 0 );
    adsr = new ADSR( 1.0, 0.04, 0.01, 1.0, 0.1 );
 
    //toneOsc.patch( gainGate );
    toneOsc.patch( adsr );
  }
  
  void noteOn( float dur )
  {
    adsr.noteOn();
    gainGate.setValue( 1.0 );
    //gainGate.patch( out );
    adsr.patch( out );
  }
  
  void noteOff()
  {
    adsr.noteOff();
    gainGate.setValue( 0 );
    //gainGate.unpatch( out );
    adsr.unpatchAfterRelease( out );
  }
}
