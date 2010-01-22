class NoiseInstrument implements Instrument
{
  Noise myNoise;
  Gain  gain;
  AudioOutput out;
  BandPass filt1, filt2;
  Bus sum;
  
  float freq1, freq2, freq3;
  float bandWidth1, bandWidth2;
  
  NoiseInstrument( float amplitude, AudioOutput output )
  {
    out = output;
    freq1 = 150.0;
    bandWidth1 = 10.0;
    
    myNoise = new Noise( amplitude, Noise.Tint.RED );
    gain = new Gain( 0 );
    filt1 = new BandPass( freq1, bandWidth1, out.sampleRate() );
    filt2 = new BandPass( freq2(), bandWidth2(), out.sampleRate() );
    sum = new Bus();

    myNoise.patch( filt1 ).patch( sum );
    myNoise.patch( filt2 ).patch( sum );
    sum.patch( gain ).patch( out );
  }
  
  void noteOn( float dur )
  {
    //println("Note on!");
    gain.setValue(1);
  }
  
  void noteOff()
  {
    //println("Note off!");
    gain.setValue(0);
  }
  
  float freq2()
  {
    return 2.0*freq1;
  }
  
  float bandWidth2()
  {
    return 2.0*bandWidth1;
  }
  
  void setFilterCF( float cf )
  {
    freq1 = cf;
    filt1.setFreq( freq1 );
    filt2.setFreq( freq2() );
  }
  
  void setFilterBW( float bw )
  {
    bandWidth1 = bw;
    filt1.setBandWidth( bandWidth1 );
    filt2.setBandWidth( bandWidth2() );
  }
  
  void setFilterQ( float q )
  {
    bandWidth1 = freq1/q;
    filt1.setBandWidth( bandWidth1 );
    filt2.setBandWidth( bandWidth2() );
  }
}
