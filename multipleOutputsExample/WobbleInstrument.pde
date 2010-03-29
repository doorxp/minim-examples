// this instrument uses a single LFO to control the amplitude of one sine
// and the frequency modulation of another.
class WobbleInstrument implements Instrument
{
  // our two tones and LFO
  Oscil sine1, sine2, LFO;
  // a gain that will be applied to the LFO before it is used for frequency modulation
  Gain  gainLFO;
  AudioOutput out;
  
  WobbleInstrument(float frequency, float amplitude, float lFOFreq, AudioOutput output)
  {
    out = output;
    sine1 = new Oscil(frequency, amplitude, Waves.SINE);
    sine2 = new Oscil(frequency*2.0, amplitude, Waves.SINE);
    LFO = new Oscil( lFOFreq/2.0, 0.5f, Waves.SINE );
    // to get the second oscillator to have a large frequency wobble, we need to increase the
    // gain of the LFO a lot.
    gainLFO = new Gain(60.0);
 
    // control the amplitude of sine1
    LFO.patch( sine1.amplitude );
    // and the frequency modulation of sine2
    LFO.patch(gainLFO).patch( sine2.frequencyModulation );
  }
  
  void noteOn(float dur)
  {
    sine1.patch( out );
    sine2.patch( out );
  }
  
  void noteOff()
  {
    sine1.unpatch( out );
    sine2.unpatch( out );
  }
}
