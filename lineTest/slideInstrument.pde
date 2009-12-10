class SlideInstrument implements Instrument
{
  Oscil tone;
  Gain  gate;
  Line  freqControl;
  AudioOutput out;
  
  SlideInstrument(float begFreq, float endFreq, float amp, AudioOutput output)
  {
    out = output;
    tone = new Oscil(begFreq, amp, Waves.Triangle);
    gate = new Gain(0);
    freqControl = new Line(2.8, begFreq, endFreq);
    freqControl.patch(tone.frequency);
    tone.patch(gate).patch(out);
  }
  
  void noteOn()
  {
    //println("Note on!");
    gate.setValue(1);
    freqControl.activate();
  }
  
  void noteOff()
  {
    //println("Note off!");
    gate.setValue(0);
  }
}
