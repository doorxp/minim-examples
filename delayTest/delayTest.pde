import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.javasound.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
LiveInput in;
Delay myDelay1, myDelay2, myDelay3;
Oscil myLFO;
Constant myConst;
Summer sum;

void setup()
{
  size(600, 200);
  
  minim = new Minim(this);
  minim.debugOn();
  out = minim.getLineOut(Minim.MONO, 512 );
  in = new LiveInput( minim.getInputStream(Minim.MONO, 256, 44100.f, 16) );  
  myDelay1 = new Delay( 0.15, 0.5, false, false);
  myDelay2 = new Delay( 0.30, 0.45, false, false);
  myDelay3 = new Delay( 0.60, 0.4, false, false);
  myLFO = new Oscil( 1.0, 0.14 );
  myConst = new Constant( 0.25 );
  sum = new Summer();
  
  myConst.patch( sum );
  myLFO.patch( sum );
  //sum.patch( myDelay.delay );
  in.patch( myDelay1 ).patch( sum );
  in.patch( myDelay2 ).patch( sum );
  in.patch( myDelay3 ).patch( sum );
  sum.patch( out );
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

void mouseMoved()
{
  float delayTime = map( mouseX, 0, width, 0.0001, 0.5 );
  //myDelay.setDelTime( delayTime );
  float feedbackFactor = map(mouseY, 0, height, 0.0, 0.99);
  //myDelay.setDelAmp( feedbackFactor );
}

void stop()
{
  // should close the Input so it can close its stream
  in.close();
  out.close();
  minim.stop();
  
  super.stop();
}

