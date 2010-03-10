/* pinkNoiseInstrument
   just plays a burst of pink noise of the specified length
   
   author: Anderson Mills
   Anderson Mills's work was sponsored by numediart (www.numediart.org).
*/

// Every instrument must implement the Instrument interface so 
// playNote() can call the instrument's methods.
class PinkNoiseInstrument implements Instrument
{
  // create all variables that must be used throughout the class
  Noise myNoise;
  Gain  gain;
  AudioOutput out;
  
  // constructors for the intsrument
  PinkNoiseInstrument( float amplitude, AudioOutput output )
  {
    // equate class variables to constructor variables as necessary
    out = output;
    
    // create new instances of any UGen objects as necessary
    // pink noise is used for this instrument
    myNoise = new Noise(amplitude, Noise.Tint.PINK);
    gain = new Gain(0);
    
    // patch everything together up to the final output
    myNoise.patch(gain);
  }
  
  // every instrument must have a noteOn( float ) method
  void noteOn(float dur)
  {
    // turn on the gain
    gain.setValue( 1.0 );
    // and patch to the output
    gain.patch( out );
  }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    // turn off the gain
    gain.setValue( 0 );
    // and unpatch the output 
    // this causes the entire instrument to stop calculating sampleframes
    // which is good when the instrument is no longer generating sound.
    gain.unpatch( out );
  }
}
