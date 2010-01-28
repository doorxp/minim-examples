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
  //minim.debugOn();
  out.pauseNotes();
  
  out.setTempo( 90.0 );
  out.setNoteOffset( 2.0 );
  float vol = 0.33;
  out.playNote( 0.00, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 0.25, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 0.75, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 1.25, 0.2, new ToneInstrument( "C5", vol, out) );
  out.playNote( 1.50, 0.2, new ToneInstrument( "E5", vol, out) );
  out.playNote( 2.00, 0.2, new ToneInstrument( "G5", vol, out) );
  out.playNote( 2.75, 0.2, new ToneInstrument( "G4", vol, out) );
  
  out.playNote( 0.00, 0.1, new ToneInstrument( "Fa#", vol, out) );
  out.playNote( 0.25, 0.1, new ToneInstrument( "Fa", vol, out) );
  out.playNote( 0.75, 0.1, new ToneInstrument( "Fa", vol, out) );
  out.playNote( 1.25, 0.1, new ToneInstrument( "Fa#", vol, out) );
  out.playNote( 1.50, 0.1, new ToneInstrument( "Fa", vol, out) );
  out.playNote( 2.00, 0.1, new ToneInstrument( "Si", vol, out) );
  out.playNote( 2.75, 0.1, new ToneInstrument( "Sol", vol, out) );
  
  out.playNote( 0.00, 0.15, new ToneInstrument( "Re 3", vol, out) );
  out.playNote( 0.25, 0.15, new ToneInstrument( "Re 3", vol, out) );
  out.playNote( 0.75, 0.15, new ToneInstrument( "Re 3", vol, out) );
  out.playNote( 1.25, 0.15, new ToneInstrument( "Re 3", vol, out) );
  out.playNote( 1.50, 0.15, new ToneInstrument( "Re 3", vol, out) );
  out.playNote( 2.00, 0.15, new ToneInstrument( "", vol, out) );
  out.playNote( 2.75, 0.15, new ToneInstrument( "Sol 3", vol, out) );
  
  out.setNoteOffset( 6.5 );
  out.playNote( 0.00, 0.2, new ToneInstrument( "La-1", vol, out) );
  out.playNote( 0.25, 0.2, new ToneInstrument( "La#0", vol, out) );
  out.playNote( 0.50, 0.2, new ToneInstrument( "La##1", vol, out) );
  out.playNote( 0.75, 0.2, new ToneInstrument( "La 2", vol, out) );
  out.playNote( 1.00, 0.2, new ToneInstrument( "La 3", vol, out) );
  out.playNote( 1.25, 0.2, new ToneInstrument( "La 4", vol, out) );
  out.playNote( 1.50, 0.2, new ToneInstrument( "La 5", vol, out) );
  out.playNote( 1.75, 0.2, new ToneInstrument( "La 6", vol, out) );
  out.playNote( 2.00, 0.2, new ToneInstrument( "La 7", vol, out) );
  out.playNote( 2.25, 0.2, new ToneInstrument( "La 8", vol, out) );
  out.playNote( 2.50, 0.2, new ToneInstrument( "La 9", vol, out) );
  out.playNote( 2.75, 0.2, new ToneInstrument( "La 10", vol, out) );
  out.playNote( 3.00, 0.2, new ToneInstrument( "La 11", vol, out) );
  out.playNote( 3.25, 0.2, new ToneInstrument( "La 8", vol, out) );
 
  out.playNote( 4.00, 0.2, new ToneInstrument( "C 4", vol, out) );
  out.playNote( 4.25, 0.2, new ToneInstrument( "Do ", vol, out) );
  out.playNote( 4.50, 0.2, new ToneInstrument( " b ", vol, out) );
  out.playNote( 4.75, 0.2, new ToneInstrument( "  5", vol, out) );
  out.playNote( 5.00, 0.2, new ToneInstrument( " y ", vol, out) );
  out.playNote( 5.25, 0.2, new ToneInstrument( "Fa  ", vol, out) );

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

