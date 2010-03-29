// this instrument uses a WaveShaper to shape an Oscil
// over time.
class WaveShaperInstrument implements Instrument
{
  // our tone
  Oscil sineOsc;
  // what we'll shape our oscil with
  WaveShaper shaper;
  // a line to change the amount of shaping over time
  Line shaperAmountLine;
  
  AudioOutput out;

  WaveShaperInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.SINE);
    // we want to shape the sine with a saw wave. the second argument 
    // is the amount of shaping to be applied, which in our case doesn't 
    // really matter because we are going to drive that with a Line
    shaper = new WaveShaper( Waves.SAW, 1 );
    shaperAmountLine = new Line(5.f, 1.f, 25.f);
   
    shaperAmountLine.patch( shaper.amount );
    sineOsc.patch( shaper );
  }
 
  void noteOn(float dur)
  {
    // set our line time based on duration
    shaperAmountLine.setLineTime( dur );
    shaperAmountLine.activate();
    shaper.patch( out );
  }
  
  void noteOff()
  {
    shaper.unpatch( out );
  }
}
