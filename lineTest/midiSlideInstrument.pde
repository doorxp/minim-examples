class MidiSlideInstrument implements Instrument
{
  Oscil tone;
  Gain  gate;
  Line  freqControl;
  AudioOutput out;
  
  MidiSlideInstrument(float begNote, float endNote, float amp, AudioOutput output)
  {
    out = output;
    tone = new Oscil( begNote, amp, Waves.Triangle );
    gate = new Gain( 0 );
    freqControl = new Line( 1.0, begNote, endNote );
    freqControl.patch( tone.midiFrequency );
    tone.patch( gate ).patch( out );
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
