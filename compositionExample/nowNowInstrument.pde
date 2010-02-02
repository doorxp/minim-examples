class nowNowInstrument implements Instrument
{
  Oscil sineOsc;
  ADSR  adsr;
  Summer sum;
  BitCrush crush;
  Gain gainLo, gainHi;
  IIRFilter bpFilt1, bpFilt2;
  AudioOutput out;
  
  nowNowInstrument(float frequency, float amplitude, float tweak, AudioOutput output)
  {
    this(frequency, amplitude, tweak, 0.5, 16.0, output);
  }
  nowNowInstrument(float frequency, float amplitude, float tweak, float high, AudioOutput output)
  {
    this( frequency, amplitude, tweak, high, 16.0, output );
  }
  nowNowInstrument(float frequency, float amplitude, float tweak, float high, float bitRes, AudioOutput output)
  {
    amplitude = 0.7*amplitude;
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Saw);
    adsr = new ADSR(0.5, 0.005, 0.01, 0.5, 0.2);
    float cf1 = frequency*(1+((float)Math.random() - 0.5) ) * tweak;
    float cf2 = cf1*10.0*tweak;
    float bw1 = 1.0*cf1*tweak;
    float bw2 = bw1*(2+((float)Math.random()) )*tweak;
    bpFilt1 = new BandPass( cf1, bw1, out.sampleRate());
    bpFilt2 = new BandPass( cf2, bw2, out.sampleRate());
    gainLo = new Gain( 2*(1-high));
    gainHi = new Gain( 2*high);
    crush = new BitCrush( bitRes );
    sum = new Summer();
    
    sineOsc.patch(bpFilt1).patch(gainLo).patch(sum);
    sineOsc.patch(bpFilt2).patch(gainHi).patch(sum);
  }
  
  void noteOn( float dur )
  {
    sum.patch(crush).patch(adsr).patch(out);
    adsr.noteOn();
  }
  
  void noteOff()
  {
    adsr.noteOff();
    adsr.unpatchAfterRelease( out );
  }
}
