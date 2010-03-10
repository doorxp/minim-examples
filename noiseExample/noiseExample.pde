/* noiseExample
is a example of how to use noise in an instrument.
It is shows the different types of noise using a slightly
interesting bouncing cyan bar.

author:Anderson Mills
Anderson Mills's work was supported by numediart (www.numediart.org).
*/

// import everything necessary to make sound.
import ddf.minim.*;
import ddf.minim.ugens.*;

// create all of the variables that will need to be accessed in
// more than one methods (setup(), draw(), stop()).
Minim minim;
AudioOutput out;
// used as instruments
WhiteNoiseInstrument myWhiteNoise;
RedNoiseInstrument myRedNoise;
PinkNoiseInstrument myPinkNoise;
// used for the drawing
color noiseColor;
int xa;
int xDir;
int iFlip;

// setup is run once at the beginning
void setup()
{
  // initialize the minim and out objects
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 512);
  // define the notes that will be played
  myWhiteNoise = new WhiteNoiseInstrument( 0.5, out );
  myRedNoise = new RedNoiseInstrument( 0.5, out );
  myPinkNoise = new PinkNoiseInstrument( 0.5, out );
  // define some variables for making the drawing
  xa = 10;
  xDir = 1;
  iFlip = 0;
  noiseColor = color( 255, 255, 255 );

  size( 100, 200, P2D );

  
}

// draw is run many times
void draw()
{
  // erase the window to black
  background(0);
  // move the bouncing line along one step
  xa = xa + xDir;
  
  // if the line is at the right border, make a noise and go left
  if ( xa > width-1 )
  {
    xDir = -1;
    // if the iFlip flag is zero make white noise
    if ( 0 == iFlip )
    {
    out.playNote( 0, 1.5, myWhiteNoise );
    noiseColor = color( 255, 255, 255 );
    // otherwise make the iFlip flag red noise
    } else
    {
      out.playNote( 0, 1.5, myRedNoise );
      noiseColor = color( 255, 0, 0 );
    }
    // flip the value of the iFlip flag
    iFlip = 1 - iFlip;
  }
  // if the line is at the left border, make a noise and go right
  if ( xa  < 1 )
  {
    xDir = 1;
    out.playNote( 0, 1.5, myPinkNoise );
    noiseColor = color( 255, 128, 128 );
  }
  
  // color the drawing the same as the noise tint
  stroke( noiseColor );
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  // make the cyan bouncing line and it's inverse
  stroke( 0, 255, 255 );
  line( xa, 0, xa, 100 );
  line( width-xa, 100, width-xa, 200 );
}

// stop is run when the user presses stop
void stop()
{
  // close the AudioOutput
  out.close();
  // stop the minim object
  minim.stop();
  // stop the processing object
  super.stop();
}

