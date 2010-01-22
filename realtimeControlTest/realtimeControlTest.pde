import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
NoiseInstrument myNoise;

void setup()
{
  size( 500, 500 );

  minim = new Minim( this );
  out = minim.getLineOut( Minim.MONO, 512 );
  myNoise = new NoiseInstrument( 1.0, out );
  out.playNote( 0, 100.0, myNoise );

}

void draw()
{
  background(0);
  stroke( 255 );
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
  float freq = map(mouseY, 0, height, 1500, 150);
  myNoise.setFilterCF( freq );
  float q = map(mouseX, 0, width, 0.9, 100);
  myNoise.setFilterQ( q );
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

