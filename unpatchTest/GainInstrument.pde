class GainInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  AudioOutput out;
  
  GainInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Sine);
    gainGate = new Gain(0);
    sineOsc.patch(gainGate);
  }
  
  void noteOn(float dur)
  {
    println("Instron!");
    gainGate.setValue(1.0);
    gainGate.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue(0);
    gainGate.unpatch( out );
  }
}
