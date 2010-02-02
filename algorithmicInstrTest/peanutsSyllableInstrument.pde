class PeanutsSyllableInstrument implements Instrument
{
  Oscil toneOsc;
  ADSR adsr;
  ADSR upDown;
  Constant one;
  Balance balance;
  Summer sum;
  AudioOutput out;
  IIRFilter lpFiltFixed, lpFilterSlide, bpFilter1, bpFilter2;
  float fadeTime;
  
  float lpFixedLoFreq = 523.0;
  float lpFixedHiFreq = 848.0;
  float bp1LoFreq = 2297.0;
  float bp1HiFreq = 2820.0;
  float bp1BW = 750.0;  
  float bp2LoFreq = 3147.0;
  float bp2HiFreq = 4500.0;
  float bp2BW = 500.0;
  float slideHeightMin = 999.0;
  float slideHeightMax = 2786.0; 
  float slideHeight;
  
  
  PeanutsSyllableInstrument(float amp, float toneFreq, float fadeTime, float balanceVal, Wavetable baseWave, AudioOutput output)
  {
    
    out = output;
    this.fadeTime = fadeTime;
    
    float lpFixedFreq = lpFixedLoFreq + (float)Math.random()*( lpFixedHiFreq - lpFixedLoFreq );
    float bp1Freq = bp1LoFreq + (float)Math.random()*( bp1HiFreq - bp1LoFreq );
    float bp2Freq = bp2LoFreq + (float)Math.random()*( bp2HiFreq - bp2LoFreq );
    slideHeight = slideHeightMin + (float)Math.random()*( slideHeightMax - slideHeightMin );

    toneOsc = new Oscil( toneFreq, amp, baseWave );
    adsr = new ADSR( 1.0, fadeTime, 0.0, 1.0, fadeTime );
    upDown = new ADSR( 1000.0, 1.0, 1.0, 0.1, 1.0 );
    one = new Constant( 1.0 );
    balance = new Balance( balanceVal );
    lpFiltFixed = new LowPassSP( lpFixedFreq, out.sampleRate() );
    lpFilterSlide = new LowPassSP( 1000.0, out.sampleRate() );
    bpFilter1 = new BandPass( bp1Freq, bp1BW, out.sampleRate() );
    bpFilter2 = new BandPass( bp2Freq, bp2BW, out.sampleRate() );
    sum = new Summer();
 
    one.patch( upDown ).patch( lpFilterSlide.cutoff );
    toneOsc.patch( lpFiltFixed ).patch( sum );
    toneOsc.patch( bpFilter1 ).patch( sum );
    toneOsc.patch( bpFilter2 ).patch( sum );
    sum.patch( lpFilterSlide ).patch( balance ).patch( adsr );
  }
  
  void noteOn( float dur )
  {
    float halfTime = dur/2.0;
    upDown.setParameters( slideHeight, halfTime, halfTime+2*fadeTime, 0.0, 1.0, 0.0, 0.0 ); 
    adsr.patch(out);
    adsr.noteOn();
    upDown.noteOn();
  }
  
  void noteOff()
  {
    adsr.noteOff();
    upDown.noteOff();
    adsr.unpatchAfterRelease( out );
  }
}
