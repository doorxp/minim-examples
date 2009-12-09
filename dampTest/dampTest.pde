import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SineInstrument mySine;
SineInstrument myOtherSine;

int xa;
int xDir;

void setup()
{
  size(100, 100);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 2048);
  mySine = new SineInstrument(115, 1.0, out);
  myOtherSine = new SineInstrument(220, 0.3, out);

  out.playNote(0.05, 0.3, new SineInstrument(115, 1.0, out));
  out.playNote(0.40, 0.3, new SineInstrument(115, 1.0, out));
  //for(int i = 0; i < 16; i++)
  //{
  //  out.playNote(0.25 + i*0.5, 0.3, new SineInstrument(115, 1.0, out));
  //  //out.playNote(i*0.5, 0.05, myOtherSine);
  //}
  
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
  }
  if ( xa < 1 )
  {
    xDir = 1;
    //out.playNote( 0, 0.1, myOtherSine );
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

