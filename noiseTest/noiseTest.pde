import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
WhiteNoiseInstrument myWhiteNoise;
RedNoiseInstrument myRedNoise;
PinkNoiseInstrument myPinkNoise;
color noiseColor;
int xa;
int xDir;
int iFlip;

void setup()
{
  size(100, 200);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 512);
  myWhiteNoise = new WhiteNoiseInstrument( 0.5, out );
  myRedNoise = new RedNoiseInstrument( 0.5, out );
  myPinkNoise = new PinkNoiseInstrument( 0.5, out );

  xa = 10;
  xDir = 1;
  iFlip = 0;
  noiseColor = color( 255, 255, 255 );
}

void draw()
{
  background(0);
  xa = xa + xDir;
  if ( xa > width-1 )
  {
    xDir = -1;
    if ( 0 == iFlip )
    {
    out.playNote( 0, 1.5, myWhiteNoise );
    noiseColor = color( 255, 255, 255 );
    } else
    {
      out.playNote( 0, 1.5, myRedNoise );
      noiseColor = color( 255, 0, 0 );
    }
    iFlip = 1 - iFlip;
  }
  if ( xa  < 1 )
  {
    xDir = 1;
    out.playNote( 0, 1.5, myPinkNoise );
    noiseColor = color( 255, 128, 128 );
  }
  
  stroke( noiseColor );
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  stroke( 0, 255, 255 );
  line( xa, 0, xa, 100 );
  line( width-xa, 100, width-xa, 200 );

}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

