class BrapInstrument implements Instrument
{
  Oscil toneOsc, lfoOsc;
  ADSR  adsr;
  Noise redNoise;
  Summer sum;
  GranulateSteady chopper;
  AudioOutput out;
  
  BrapInstrument(float amp, float toneFreq, float onTime, float offTime, AudioOutput output)
  {
    out = output;
    toneOsc = new Oscil(toneFreq, amp, Waves.TRIANGLE);
    lfoOsc = new Oscil( toneFreq/2.0, toneFreq/2.0, Waves.SAW);
    redNoise = new Noise( amp/8.0, Noise.Tint.RED);
    adsr = new ADSR( 1.0, 0.003, 0.003, 1.0, 0.003 );
    chopper = new GranulateSteady( onTime, offTime, 0.0025);
    sum = new Summer();
    
    lfoOsc.patch(toneOsc.frequencyModulation);
    toneOsc.patch( sum );
    redNoise.patch( sum );
    sum.patch(chopper).patch( adsr );
  }
  
  void noteOn(float dur)
  {
    adsr.patch(out);
    adsr.noteOn();
  }
  
  void noteOff()
  {
    adsr.noteOff();
    adsr.unpatchAfterRelease( out );
  }
}
