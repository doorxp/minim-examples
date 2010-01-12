class ToneInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  AudioOutput out;
  int iNote; 
  
  ToneInstrument(float frequency, float amplitude, int iN, AudioOutput output)
  {
    out = output;
    iNote = iN;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    gainGate = new Gain(0);
    //println("Instrument: about to patch");
    sineOsc.patch(gainGate);
    //println("Instrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Instron number " + iNote );
    gainGate.setValue(1.0);
    gainGate.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue(0);
  }
}
