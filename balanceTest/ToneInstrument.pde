class ToneInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Balance balance;
  Gain  gainGate;
  AudioOutput out;
  
  ToneInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    lFOOsc = new Oscil(2.0, 1.0, Waves.Sine);
    balance = new Balance( 0 );
    gainGate = new Gain(0);
    println("Instrument: about to patch");
    lFOOsc.patch( balance.balance );
    sineOsc.patch( balance.audio ).patch( gainGate );
    //sineOsc.patch(gainGate);
    println("Instrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Instron!");
    gainGate.setValue( 1.0 );
    gainGate.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue( 0 );
  }
}
