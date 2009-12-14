class nowNowInstrument implements Instrument
{
  Oscil sineOsc;
  ADSR  adsr;
  AudioOutput out;
  IIRFilter bpFilt;
  
  nowNowInstrument(float frequency, float amplitude, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Triangle);
    adsr = new ADSR(0.5, 0.005, 0.01, 0.5, 0.3);
    bpFilt = new BandPass( 400, 100, out.sampleRate());
    sineOsc.patch(bpFilt).patch(adsr).patch(out);
  }
  
  void noteOn( float dur )
  {
    adsr.noteOn();
  }
  
  void noteOff()
  {
    adsr.noteOff();
  }
}
