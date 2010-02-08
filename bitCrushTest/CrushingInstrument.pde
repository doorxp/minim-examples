class CrushingInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  BitCrush bitCrush;
  Line crushLine;
  AudioOutput out;
  
  CrushingInstrument(float frequency, float amplitude, float hiBitRes, float loBitRes, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.SINE);
    bitCrush = new BitCrush(hiBitRes);
    crushLine = new Line(9.0, hiBitRes, loBitRes);
    gainGate = new Gain(0);

    println("CrushInstrument: about to patch");
    crushLine.patch(bitCrush.bitRes);
    sineOsc.patch(bitCrush).patch(gainGate).patch(out);
    //sineOsc.patch(gainGate).patch(out);
    println("CrushInstrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Crush on!");
    gainGate.setValue(0.5);
    crushLine.activate();
  }
  
  void noteOff()
  {
    println("Crush off!");
    gainGate.setValue(0);
  }
}
