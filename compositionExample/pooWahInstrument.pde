class PooWahInstrument implements Instrument
{
  Oscil sineOsc;
  ADSR hitDamp, adsr;
  Line baseFreq;
  Noise redNoise;
  //ADSR  adsr;
  Bus sum1, sum;
  AudioOutput out;
  //Gain gainLo, gainHi;
  IIRFilter lpFilt1;
  //, bpFilt2;
  //static Wavetable baseWave = Waves.Square(3);
  
  PooWahInstrument(float amp, float begFreq, float susFreq, Wavetable baseWave, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(begFreq, amp, baseWave);
    redNoise = new Noise( 0.3, Noise.Tint.RED );
    adsr = new ADSR(1.0, 0.003, 0.0640, 0.2, 0.050);
    hitDamp = new ADSR(1.0, 0.003, 0.0640, 0.0, 0.050);
    baseFreq = new Line( 0.067, begFreq, susFreq );
    lpFilt1 = new LowPassSP( susFreq, out.sampleRate() );
    sum = new Bus();
    sum1 = new Bus();
    baseFreq.patch(sineOsc.frequency);
    redNoise.patch(hitDamp).patch(lpFilt1).patch(sum1);
    sineOsc.patch(sum1);
    sum1.patch(adsr);
  }
  
  void noteOn( float dur )
  {
    adsr.patch(out);
    adsr.noteOn();
    hitDamp.noteOn();
    baseFreq.activate();
  }
  
  void noteOff()
  {
    hitDamp.noteOff();
    adsr.noteOff();
    adsr.unpatchAfterNoteFinished(out);
  }
}
