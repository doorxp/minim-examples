// Every instrument must implement the Instrument interface so 
// playNote() can call the instrument's methods.
class ToneInstrument implements Instrument
{
  // create all variables that must be used throughout the class
  Oscil sineOsc, lFOOsc;
  Gain  gainGate;
  AudioOutput out;
  
  // constructors for our intsrument
  ToneInstrument( float frequency, float amplitude, AudioOutput output )
  {
    // equate class variables to constructor variables as necessary 
    out = output;
    
    // create new instances of any UGen objects as necessary
    sineOsc = new Oscil( frequency, amplitude, Waves.SINE );
    gainGate = new Gain( 0 );
    
    // patch everything together up to the final output
    sineOsc.patch( gainGate );
  }
  
  // every instrument must have a noteOn() method
  void noteOn( float dur )
  {
    // turn on the gain
    gainGate.setValue( 1.0 );
    // and patch to the output
    gainGate.patch( out );
  }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    // turn off the gain
    gainGate.setValue( 0 );
    // and unpatch the output 
    // this causes the entire instrument to stop calculating sampleframes
    // which is good when the instrument is not generating sound.
    gainGate.unpatch( out );
  }
}
