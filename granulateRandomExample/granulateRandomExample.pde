/* granulateRandomExample
   is an example of using the GranulateRandom UGen inside an instrument.
   The GranulateRandom UGen is basically an amplitude modulation of the
   incoming audio, which turns on for a random amount of time and then off
   again for a random amount of time.  If one uses several of these concurrently
   it produces the "grain cloud" typical of granular synthesis.

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

// setup is run once at the beginning
void setup()
{
  // initialize the drawing window
  size(512, 200, P2D);

  // initialize the minim and out objects
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 2048);

  // because there are so many calls to the granularInstrument
  float myOffset = 0.5;
  float noteLen = 0.0;
  float vol = 0.2;
  float myTargetFreq = 660.9f;
  float myTargetFreq2 = 1320.9f;
  out.setNoteOffset( myOffset );
  noteLen = 4.5;
  out.playNote( 0.0, noteLen, new GrabularInstrument( vol, 440.0f, myTargetFreq ) );
  out.playNote( 0.1, noteLen, new GrabularInstrument( vol, 440.0f, myTargetFreq ) );
  out.playNote( 0.2, noteLen, new GrabularInstrument( vol, 440.0f, myTargetFreq ) );

  myOffset += noteLen;
  out.setNoteOffset( myOffset );
  vol = 0.15;
  noteLen = 7.0;
  out.playNote( 0.00, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.05, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.10, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.15, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.20, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.25, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.30, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.35, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );
  out.playNote( 0.40, noteLen, new GrabularInstrument( vol, myTargetFreq, random( 900 ) + 100 ) );

  myOffset += noteLen;
  out.setNoteOffset( myOffset );
  vol = 0.15;
  noteLen = 7.0;
  out.playNote( 0.05, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.10, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.15, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.20, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.25, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.30, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.35, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.40, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );
  out.playNote( 0.45, noteLen, new GrabularInstrument( vol, random( 900 ) + 100, myTargetFreq2 ) );

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

