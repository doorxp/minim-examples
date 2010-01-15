
/*
algorithmicInstrTest
by nodog (John Anderson Mills III)
finished 2010-01-14

This is an example of using an instrument to handle most of the work
of algorithmic composition.  The inspiration came from the voice of
the teacher in the animated Peanuts cartoons
*/
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
AudioRecorder recorder;
PeanutsSentencer theTeacher;
void setup()
{
  size(512, 200, P2D);
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 1024);
  recorder = minim.createRecorder( out, "algorithmicInstr.wav", true );

  int nSentences = 23;
  float fundFreqA = 110.0;
  float fundFreqB = 146.0;
  float balanceA = 0.3;
  float balanceB = -0.3;
  float gapMin = 0.5;
  float gapMax = 1.9;
  
  out.setTempo( 60f );
  out.setNoteOffset( 1.0 );
  PeanutsSentencer theTeacher;
  theTeacher = new PeanutsSentencer( out );
  
  float startSum = 0.0;
  
  for ( int iSent = 0; iSent < nSentences; iSent ++ )
  {
    float fundFreq, balance;
    if ( iSent%2 == 0 )
    {
      fundFreq = fundFreqA;
      balance = balanceA;
    } else
    {
      fundFreq = fundFreqB;
      balance = balanceB;
    }
    //  float fundFreq = (float)Math.random()*(fundFreqMax - fundFreqMin ) + fundFreqMin;
    //float balance = (float)Math.random()*(balanceMax - balanceMin ) + balanceMin; 
    float gapTime = (float)Math.random()*(gapMax - gapMin ) + gapMin;
    theTeacher.setParameters( startSum, fundFreq, balance );
    float lastLen = theTeacher.saySentence();
    startSum += lastLen + gapTime;
  }
}

void draw()
{
  background(0);
  stroke(255);
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  
}

void keyReleased()
{
  if ( key == 'r' ) 
  {
    if ( recorder.isRecording() ) 
    {
      
      recorder.endRecord();
      println("ending recording");
    }
    else 
    {
      println("beginning recording");
      recorder.beginRecord();
    }
  }
  if ( key == 's' )
  {
    recorder.save();
    println("Done saving.");
  }
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}


