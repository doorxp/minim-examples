class MidiSlideInstrument implements Instrument
{
  Oscil tone;
  Gain  gate;
  Line  freqControl;
  Balance left, right;
  Midi2Hz midi2Hz;
  AudioOutput out;
  
  MidiSlideInstrument(float begNote, float endNote, float amp, AudioOutput output)
  {
    out = output;
    tone = new Oscil( begNote, amp, Waves.TRIANGLE );
    gate = new Gain( 0 );
    freqControl = new Line( 1.0, begNote, endNote );
    midi2Hz = new Midi2Hz();
    left = new Balance( -1 );
    right = new Balance( 1 );
    freqControl.patch( midi2Hz ).patch( tone.frequency );
    tone.patch( left ).patch( gate ).patch( out );
  }
  
  void noteOn( float dur )
  {
    //println("Note on!");
    gate.setValue( 1 );
    freqControl.setLineTime( dur );
    freqControl.activate();
  }
  
  void noteOff()
  {
    //println("Note off!");
    gate.setValue( 0 );
  }
}
