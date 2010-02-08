class PeanutsSentencer
{
  float startTime;
  float fundFreq;
  float balanceVal;
  AudioOutput out;
  Wavetable baseWave = Waves.saw(50);

  float syllAmp = 0.6;
  float syllFadeTime = 0.03;

  float syllLenMin = 0.14;
  float syllLenMax = 0.31;
  float syllAmpModMin = 0.95;
  float syllAmpModMax = 1.05;
  float syllFreqModMin = 0.96;
  float syllFreqModMax = 1.02;
  float syllFadeTimeModMin = 0.90;
  float syllFadeTimeModMax = 1.10;
  boolean lastSyllFixedFreqMod = true;
  float questionChance = 0.14;
  float[] lastSyllFreqMod = { 0.89, 1.11 };
  boolean lastSyllLong = true;

  PeanutsSentencer( AudioOutput out )
  {
    this.out = out;
  }
  
  PeanutsSentencer( float startTime, float fundFreq, float balanceVal, AudioOutput out )
  {
    this.startTime = startTime;
    this.fundFreq = fundFreq; 
    this.balanceVal = balanceVal;
    this.out = out;
  }
  
  void setParameters ( float startTime, float fundFreq, float balanceVal )
  {
    this.startTime = startTime;
    this.fundFreq = fundFreq; 
    this.balanceVal = balanceVal;
  }
  
  float saySentence()
  {
    int nSylls = 3 + 2*(int)floor( 6.0*(float)Math.random() );
    float syllLens[] = new float[ nSylls ];
    float syllAmps[] = new float[ nSylls ];
    float syllFreqs[] = new float[ nSylls ];
    float syllFadeTimes[] = new float[ nSylls ];
    
    for ( int iSyll = 0; iSyll < nSylls; iSyll++ )
    {
      syllLens[ iSyll ] = (float)Math.random()*( syllLenMax - syllLenMin ) + syllLenMin;
      syllAmps[ iSyll ] = syllAmp*( (float)Math.random()*( syllAmpModMax - syllAmpModMin ) + syllAmpModMin );
      syllFreqs[ iSyll ] = fundFreq*
          ( (float)Math.random()*( syllFreqModMax - syllFreqModMin ) + syllFreqModMin );
      syllFadeTimes[ iSyll ] = syllFadeTime*
          ( (float)Math.random()*( syllFadeTimeModMax - syllFadeTimeModMin ) + syllFadeTimeModMin );      
    }
    if ( lastSyllFixedFreqMod )
    {
      int iPhraseType = 0;
      if ( Math.random() < questionChance )
      {
        iPhraseType = 1;
      }
      syllFreqs[ nSylls - 1 ] = fundFreq * lastSyllFreqMod[ iPhraseType ];
    }
    if ( lastSyllLong )
    {
      syllLens[ nSylls - 1 ] = syllLenMax;
    }
    
    float fadeLast = 0.0;
    float lenSum = 0.0;
    out.pauseNotes();
    for ( int iSyll = 0; iSyll < nSylls; iSyll++ )
    {
      float thisStart = startTime + lenSum + fadeLast;
      out.playNote( thisStart, syllLens[ iSyll ], 
          new PeanutsSyllableInstrument( syllAmps[ iSyll ], syllFreqs[ iSyll ], syllFadeTimes[ iSyll ],
              balanceVal, baseWave, out ) );
      lenSum += syllLens[ iSyll ] + fadeLast;        
      fadeLast = syllFadeTimes[ iSyll ];
     }
     out.resumeNotes();
     return lenSum + fadeLast;
  }

}
