class ToneInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  AudioOutput out;
  
  ToneInstrument(String note, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil( Frequency.ofPitch( note ), amplitude, Waves.TRIANGLE );
    gainGate = new Gain(0);
    println("Instrument: about to patch");
    sineOsc.patch(gainGate);
    println("Instrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Instron!");
    //sineOsc.setFrequency( 123.45 );
    gainGate.setValue(1.0);
    gainGate.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue(0);
    
  }
  
  ToneInstrument setNote( String note )
  {
    sineOsc.setFrequency( Frequency.ofPitch( note ) );
    return this;
  }
}
