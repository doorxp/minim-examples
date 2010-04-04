/* delayExample
   is an example of using the Delay UGen in a continuous sound example.
   author: Anderson Mills
   Anderson Mills's work was supported by numediart (www.numediart.org)
*/

// import everything necessary to make sound.
import ddf.minim.*;
import ddf.minim.ugens.*;

// create all of the variables that will need to be accessed in
// more than one methods (setup(), draw(), stop()).
Minim minim;
AudioOutput out;
Delay myDelay1;

// setup is run once at the beginning
void setup()
{
  // initialize the drawing window
  size( 512, 200, P2D );

  // initialize the minim and out objects
  minim = new Minim(this);
  out = minim.getLineOut( Minim.MONO, 2048 );

  
  // initialize myDelay1 with continual feedback and no audio passthrough
  myDelay1 = new Delay( 0.6, 0.9, true, false);
  // create the tone that will be used
  Oscil myTone = new Oscil( 245.0, 0.3, Waves.saw( 13 ) );
  // create an LFO to be used for an amplitude envelope
  Oscil myLFO = new Oscil( 0.5, 0.3, Waves.square( 0.005 ) );
  Summer sum = new Summer();
  
  // patch everything together
  // the LFO is patched into the amplitude modulation of the Tone  
  myLFO.patch( myTone.amplitudeModulation );

  // PROBLEM WITH REVERSING THE NEXT TWO PATCH LINES.  
  // AS IS, I GET THE TONE, BUT REVERSED,
  // I DON"T GET THE TONE.  FEH!

  // the tone is patched through the delay into the sum.
  myTone.patch( myDelay1 ).patch( sum );

  // the tone is also patched directly into the sum
  myTone.patch( sum );

  // patch the sum into the output
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
  myDelay1.setDelTime( delayTime );
  float feedbackFactor = map( mouseY, 0, height, 0.0, 0.99 );
  myDelay1.setDelAmp( feedbackFactor );
}

void stop()
{
  // should close the Input so it can close its stream
  out.close();
  minim.stop();
  
  super.stop();
}

