import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;

void setup()
{
  size(512, 200, P2D);

  minim = new Minim( this );
  out = minim.getLineOut( Minim.MONO, 1024 );
  out.playNote( 0.5, 2.6, new ToneInstrument( "A4", 0.5, out ) );
  out.playNote( 2.5, 1.6, new ToneInstrument( "F4", 0.5, out ) );
  out.playNote( 3.6, 0.9, new ToneInstrument( "D4", 0.5, out ) );
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
  out.close();
  minim.stop();

  super.stop();
}

