class SlideInstrument implements Instrument
{
  Oscil tone;
  Gain  gate;
  Constant one;
  ADSR  freqControl;
  AudioOutput out;
  
  SlideInstrument(float begFreq, float endFreq, float amp, AudioOutput output)
  {
    out = output;
    tone = new Oscil(begFreq, amp, Waves.Triangle);
    gate = new Gain(0);
    one = new Constant(1);
    freqControl = new ADSR(2*begFreq, 1.0f, 1.0f, 0.5, 1.0, begFreq, endFreq);
    one.patch(freqControl).patch(tone.frequency);
    tone.patch(out);
  }
  
  void noteOn()
  {
    //println("Note on!");
    gate.setValue(1);
    freqControl.noteOn();
  }
  
  void noteOff()
  {
    //println("Note off!");
    gate.setValue(0);
    freqControl.noteOff();
  }
}
