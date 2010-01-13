import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
SlideInstrument slider;
MidiSlideInstrument midiSlider;

void setup()
{
  size(512, 200, P2D);
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  slider = new SlideInstrument(110, 880, 0.8, out);
  out.playNote(0.25, 5.5, slider);
  midiSlider = new MidiSlideInstrument(45.0, 81.0, 0.8, out);
  out.playNote(0.25, 5.5, midiSlider);
  
  out.playNote( 6.00, 0.2, new SlideInstrument( 110, 880, 0.8, out ) );
  out.playNote( 6.25, 0.2, new MidiSlideInstrument( 45.0, 81.0, 0.8, out ) );
  out.playNote( 6.50, 0.2, new SlideInstrument( 110, 880, 0.8, out ) );
  out.playNote( 6.75, 0.2, new MidiSlideInstrument( 45.0, 81.0, 0.8, out ) );
  out.playNote( 7.00, 0.2, new SlideInstrument( 110, 880, 0.8, out ) );
  out.playNote( 7.25, 0.2, new MidiSlideInstrument( 45.0, 81.0, 0.8, out ) );
  out.playNote( 7.50, 0.2, new SlideInstrument( 110, 880, 0.8, out ) );
  out.playNote( 7.75, 0.2, new MidiSlideInstrument( 45.0, 81.0, 0.8, out ) );
  
  
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

void mousePressed()
{
  slider.noteOn( 0 );
}

void mouseReleased()
{
  slider.noteOff();
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

