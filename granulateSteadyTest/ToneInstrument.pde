class ToneInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  Gain  gainGate,gate2;
  AudioOutput out;
  Line grainLine, spaceLine, freqLine;
  GranulateSteady chopper;
  
  ToneInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Triangle);
    gainGate = new Gain(0);
    gate2 = new Gain(1);
    chopper = new GranulateSteady(0.010, 0.020, 0.0025);
    grainLine = new Line(2.6, 0.020, 0.004);
    spaceLine = new Line(2.6, 0.005, 0.026);
    freqLine = new Line(2.6, frequency/2.0, frequency*2.0);
    println("Instrument: about to patch");
    freqLine.patch(sineOsc.frequency);
    grainLine.patch(chopper.grainLen);
    spaceLine.patch(chopper.spaceLen);
    sineOsc.patch(gainGate).patch(chopper);
    println("Instrument: patched");
  }
  
  void noteOn(float dur)
  {
    println("Instron!");
    gainGate.setValue(1.0);
    grainLine.activate();
    spaceLine.activate();
    freqLine.activate();
    chopper.patch(out);
  }
  
  void noteOff()
  {
    println("Instroff!");
    gainGate.setValue(0);
  }
}
