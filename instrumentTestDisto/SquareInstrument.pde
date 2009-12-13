class SquareInstrument implements Instrument
{
  Oscil Osc;
  Gain  gain;
  AudioOutput out;
Disto disto;
Line distchange;
  
  SquareInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    Osc = new Oscil(frequency, amplitude,Waves.Sine);
    gain = new Gain(0);
    
disto = new Disto(Disto.TruncSine(), 1);

 distchange = new Line(5,1,8);
   
distchange.patch(disto.amount);
   
    Osc.patch(disto).patch(gain).patch(out);
  }
 
  void noteOn()
  {
    //println("Note on!");
    gain.setValue(1);
   distchange.activate();
  }
  
  void noteOff()
  {
    //println("Note off!");
    gain.setValue(0);
  }
}
