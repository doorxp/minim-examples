class nowNowInstrument implements Instrument
{
  Oscil sineOsc;
  ADSR  adsr;
  Bus sum;
  AudioOutput out;
  IIRFilter bpFilt1, bpFilt2;
  
  nowNowInstrument(float frequency, float amplitude, float tweak, AudioOutput output)
  {
    out = output;
    sineOsc = new Oscil(frequency, amplitude, Waves.Saw);
    adsr = new ADSR(0.5, 0.005, 0.01, 0.5, 0.2);
    float cf1 = frequency*(1+((float)Math.random() - 0.5) ) * tweak;
    //print( cf1 );
    float cf2 = cf1*10.0*tweak;
    float bw1 = 1.0*cf1*tweak;
    float bw2 = bw1*(2+((float)Math.random()) )*tweak;
    bpFilt1 = new BandPass( cf1, bw1, out.sampleRate());
    bpFilt2 = new BandPass( cf2, bw2, out.sampleRate());
    sum = new Bus();
    sineOsc.patch(bpFilt1).patch(sum);
    sineOsc.patch(bpFilt2).patch(sum);
  }
  
  void noteOn( float dur )
  {
    sum.patch(adsr).patch(out);
    adsr.noteOn();
  }
  
  void noteOff()
  {
    adsr.noteOff();
    adsr.unpatchAfterNoteFinished(out);
  }
}
