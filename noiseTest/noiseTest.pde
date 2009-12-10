import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SineInstrument mySine;
SineInstrument myOtherSine;
WhiteNoiseInstrument myWhiteNoise;
RedNoiseInstrument myRedNoise;

int xa;
int xDir;

void setup()
{
  size(100, 100);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 512);
  mySine = new SineInstrument(440, 0.3, out);
  myOtherSine = new SineInstrument(220, 0.3, out);
  myWhiteNoise = new WhiteNoiseInstrument(0.5, out);
  myRedNoise = new RedNoiseInstrument(0.5, out);

  for(int i = 0; i < 16; i++)
  {
    //out.playNote(0.25 + i*0.5, 0.1, mySine);
    //out.playNote(i*0.5, 0.05, myOtherSine);
  }
  
  xa = 10;
  xDir = 1;
}

void draw()
{
  background(0);
  xa = xa + xDir;
  if ( xa > width-1 )
  {
    xDir = -1;
    //out.playNote( 0, 0.1, mySine );
    out.playNote( 0, 0.1, myRedNoise );
  }
  if ( xa  < 1 )
  {
    xDir = 1;
    //out.playNote( 0, 0.1, myOtherSine );
    out.playNote( 0, 0.1, myWhiteNoise );
  }
  stroke( 255 );
  line( xa, 0, xa, 100 );

}

void mousePressed()
{
  mySine.noteOn();
}

void mouseReleased()
{
  mySine.noteOff();
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

