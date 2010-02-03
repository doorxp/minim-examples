import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.javasound.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
Input in;

void setup()
{
  size(600, 200);
  
  minim = new Minim(this);
  minim.debugOn();
  out = minim.getLineOut();
  in = new Input( minim.getInputStream(Minim.STEREO, 1024, 44100.f, 16) );
  
  GranulateSteady grain = new GranulateSteady();
  
  in.patch(grain).patch(out);
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

void stop()
{
  // should close the Input so it can close its stream
  in.close();
  out.close();
  minim.stop();
  
  super.stop();
}

