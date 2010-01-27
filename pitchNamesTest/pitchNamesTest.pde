import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
ToneInstrument myNote;

void setup()
{
  size(512, 200, P2D);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 1024);
  minim.debugOn();
  out.setTempo( 120.0 );
  out.pauseNotes();
  
  float vol = 0.33;
  out.playNote( 0.00, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 0.25, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 0.75, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 1.25, 0.2, new ToneInstrument( "C5", vol, out) );
  out.playNote( 1.50, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 2.00, 0.7, new ToneInstrument( "G5", vol, out) );
  out.playNote( 2.75, 0.7, new ToneInstrument( "G4", vol, out) );
  
  out.playNote( 0.00, 0.1, new ToneInstrument( "Fa#4", vol, out) );
  out.playNote( 0.25, 0.1, new ToneInstrument( "Fa4", vol, out) );
  out.playNote( 0.75, 0.1, new ToneInstrument( "Fa4", vol, out) );
  out.playNote( 1.25, 0.1, new ToneInstrument( "Fa#4", vol, out) );
  out.playNote( 1.50, 0.1, new ToneInstrument( "Fa4", vol, out) );
  out.playNote( 2.00, 0.1, new ToneInstrument( "Si4", vol, out) );
  out.playNote( 2.75, 0.1, new ToneInstrument( "Sol4", vol, out) );
  
  out.playNote( 0.00, 0.15, new ToneInstrument( "Re3", vol, out) );
  out.playNote( 0.25, 0.15, new ToneInstrument( "Re3", vol, out) );
  out.playNote( 0.75, 0.15, new ToneInstrument( "Re3", vol, out) );
  out.playNote( 1.25, 0.15, new ToneInstrument( "Re3", vol, out) );
  out.playNote( 1.50, 0.15, new ToneInstrument( "Re3", vol, out) );
  out.playNote( 2.00, 0.65, new ToneInstrument( "Do4", vol, out) );
  out.playNote( 2.75, 0.65, new ToneInstrument( "Sol3", vol, out) );
  
  out.setNoteOffset( 4.5 );
  out.playNote( 0.00, 0.2, new ToneInstrument( "La-1", 0.9, out) );
  out.playNote( 0.25, 0.2, new ToneInstrument( "La#0", 0.9, out) );
  out.playNote( 0.50, 0.2, new ToneInstrument( "La##1", 0.9, out) );
  out.playNote( 0.75, 0.2, new ToneInstrument( "La", 0.9, out) );
  out.playNote( 1.00, 0.2, new ToneInstrument( "Sol9", 0.9, out) );
  out.playNote( 1.25, 0.2, new ToneInstrument( "Sol11", 0.9, out) );
  out.playNote( 1.50, 0.2, new ToneInstrument( "7", 0.9, out) );
  out.playNote( 1.75, 0.2, new ToneInstrument( "", 0.9, out) );
  out.resumeNotes();
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

