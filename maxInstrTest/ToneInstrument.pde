class ToneInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  AudioOutput out;
  int iNote;
  float amp;
  float freq;
  
  ToneInstrument(float frequency, float amplitude, int iN, AudioOutput output)
  {
    out = output;
    iNote = iN;
    amp = amplitude;
    freq = frequency;
    sineOsc = new Oscil(frequency, amplitude, Waves.SINE);
    gainGate = new Gain(0);
    //println("Instrument: about to patch");
    sineOsc.patch(gainGate);
    //println("Instrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Instron number " + iNote + "   amp = " + amp + "   freq = " + freq );
    gainGate.setValue(1.0);
    gainGate.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue(0);
  }
}
