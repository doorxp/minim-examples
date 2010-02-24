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
Echo myEcho;
Oscil myLFO;
Constant myConst;
Summer sum;

void setup()
{
  size(600, 200);
  
  minim = new Minim(this);
  minim.debugOn();
  out = minim.getLineOut(Minim.MONO, 256);
  in = new LiveInput( minim.getInputStream(Minim.MONO, 1024, 44100.f, 16) );  
  myEcho = new Echo(1.00, 0.75, true);
  myLFO = new Oscil( 1.0, 0.14 );
  myConst = new Constant( 0.25 );
  sum = new Summer();
  
  myConst.patch( sum );
  myLFO.patch( sum );
  //sum.patch( myEcho.delay );
  in.patch( myEcho ).patch(out);
  
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
  myEcho.setDelay( delayTime );
  float feedbackFactor = map(mouseY, 0, height, 0.0, 0.99);
  myEcho.setFeedback( feedbackFactor );
}

void stop()
{
  // should close the Input so it can close its stream
  in.close();
  out.close();
  minim.stop();
  
  super.stop();
}

