//import ddf.minim.ugens.WavetableGenerator;

class ToneInstrument implements Instrument
{
  Oscil ToneOsc, envOsc;
  Gain  gainGate;
  AudioOutput out;
  
  ToneInstrument( String pitch, float amplitude, AudioOutput output)
  {
    out = output;
    float frequency = Frequency.ofPitch( pitch ).asHz();
    
    Wavetable myEnv = WavetableGenerator.gen7( 8192, 
        new float[] { 0.00, 1.00, 0.15, 1.00, 0.00 }, 
        new int[]   { 1192, 1000,   50, 5950 } );
    ToneOsc = new Oscil( frequency, 1.0f, Waves.square( 5 ) );
    envOsc = new Oscil( 1.0f, amplitude, myEnv );
    
    envOsc.patch( ToneOsc.amplitude );
  }
  
  void noteOn( float dur )
  {
    envOsc.setFrequency( 1.0f/dur );
    ToneOsc.patch( out );  
  }
  
  void noteOff()
  {
    ToneOsc.unpatch( out );
  }
}
