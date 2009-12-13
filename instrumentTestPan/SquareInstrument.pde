class SquareInstrument implements Instrument
{
  Oscil Osc1, LFO,LFOfreq;
  Gain  gain;
  AudioOutput out;
  Pan pan;
  
  SquareInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    Osc1 = new Oscil(frequency, amplitude,Waves.Sine);
     LFO = new Oscil(1, 1,Waves.Sine);
      LFOfreq = new Oscil(0.01, 20,Waves.Sine);

   pan = new Pan(1,0);
    gain = new Gain(0);
   LFO.patch(pan.balance);
    LFOfreq.patch(LFO.frequencyModulation);

    Osc1.patch(gain).patch(pan).patch(out);
  }
 
  void noteOn()
  {
    //println("Note on!");
    gain.setValue(1);
  }
  
  void noteOff()
  {
    //println("Note off!");
    gain.setValue(0);
  }
}
