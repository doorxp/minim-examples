// Every instrument must implement the Instrument interface so 
// playNote() can call the instrument's methods.

// This noise instrument uses white noise and two bandpass filters
// to make a "whistling wind" sound.  By changing using the methods which
// change the frequency and the bandwidth of the filters, the sound changes.

class NoiseInstrument implements Instrument
{
  // create all variables that must be used throughout the class
  Noise myNoise;
  Gain  gain;
  AudioOutput out;
  BandPass filt1, filt2;
  Summer sum; 
  float freq1, freq2, freq3;
  float bandWidth1, bandWidth2;
  
  // constructors for this intsrument
  NoiseInstrument( float amplitude, AudioOutput output )
  {
    // equate class variables to constructor variables as necessary 
    out = output;
    
    // give some initial values to the realtime control variables
    freq1 = 150.0;
    bandWidth1 = 10.0;
    
    // create new instances of any UGen objects
    myNoise = new Noise( amplitude, Noise.Tint.WHITE );
    gain = new Gain( 0 );
    filt1 = new BandPass( freq1, bandWidth1, out.sampleRate() );
    filt2 = new BandPass( freq2(), bandWidth2(), out.sampleRate() );
    sum = new Summer();

    // patch everything (including the out this time)
    myNoise.patch( filt1 ).patch( sum );
    myNoise.patch( filt2 ).patch( sum );
    sum.patch( gain ).patch( out );
  }
  
  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    // set the gain to 1 to turn on the note
    gain.setValue( 1 );
  }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    // set the gain to 0 to turn off the note 
    gain.setValue( 0 );
  }
  
  // this is a helper method only used internally to find the second filter
  float freq2()
  {
    // calculate the second frequency based on the first
    return 2.0*freq1;
  }
  
  // this is a helper method only used internally to find the second filter
  float bandWidth2()
  {
    // calculate the second bandwidth based on the first
    return 2.0*bandWidth1;
  }
  
  // th
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
