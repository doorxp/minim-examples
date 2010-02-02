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

  float vol = 0.45;
  out.setTempo( 100.0f );
  out.setDurationFactor( 0.95f );
  out.pauseNotes();

  Waveform disWave = Waves.Saw( 4 );
  out.playNote( 0.0, 1.0, new ToneInstrument( "E4 ", vol, disWave, out ) );
  out.playNote( 1.0, 1.0, new ToneInstrument( "E4 ", vol, disWave, out ) );
  out.playNote( 2.0, 1.0, new ToneInstrument( "E4 ", vol, disWave, out ) );
  out.playNote( 3.0, 0.75, new ToneInstrument( "C4 ", vol, disWave, out ) );
  out.playNote( 3.75, 0.25, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote( 4.0, 1.0, new ToneInstrument( "E4 ", vol, disWave, out ) );
  out.playNote( 5.0, 0.75, new ToneInstrument( "C4 ", vol, disWave, out ) );
  out.playNote( 5.75, 0.25, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote( 6.0, 2.0, new ToneInstrument( "E4 ", vol, disWave, out ) );
  disWave = Waves.Triangle( 9 );
  out.playNote( 8.0, 1.0, new ToneInstrument( "B4 ", vol, disWave, out ) );
  out.playNote( 9.0, 1.0, new ToneInstrument( "B4 ", vol, disWave, out ) );
  out.playNote(10.0, 1.0, new ToneInstrument( "B4 ", vol, disWave, out ) );
  out.playNote(11.0, 0.75, new ToneInstrument( "C5 ", vol, disWave, out ) );
  out.playNote(11.75, 0.25, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote(12.0, 1.0, new ToneInstrument( "Eb4 ", vol, disWave, out ) );
  out.playNote(13.0, 0.75, new ToneInstrument( "C4 ", vol, disWave, out ) );
  out.playNote(13.75, 0.25, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote(14.0, 2.0, new ToneInstrument( "E4 ", vol, disWave, out ) );

  disWave = Waves.RandomSquare( 6 );
  out.playNote( 0.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
  out.playNote( 2.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
  out.playNote( 4.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
  out.playNote( 6.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
  disWave = Waves.Triangle;
  out.playNote( 8.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
  out.playNote(10.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
  out.playNote(12.0, 1.9, new ToneInstrument( "C3 ", vol, disWave, out ) );
  out.playNote(14.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
    
  //-----  
  disWave = Waves.Triangle( 0.75 );  
  out.setNoteOffset( 16.0 );
  out.playNote( 0.0, 1.0, new ToneInstrument( "E5 ", vol, disWave, out ) );
  out.playNote( 1.0, 1.0, new ToneInstrument( "E4 ", vol, disWave, out ) );
  out.playNote( 2.0, 1.0, new ToneInstrument( "E5 ", vol, disWave, out ) );
  out.playNote( 3.0, 0.5, new ToneInstrument( "D#5", vol, disWave, out ) );
  out.playNote( 3.5, 0.5, new ToneInstrument( "D5 ", vol, disWave, out ) );
  out.playNote( 4.0, 0.25, new ToneInstrument( "Db5 ", vol, disWave, out ) );
  out.playNote( 4.25, 0.25, new ToneInstrument( "C5 ", vol, disWave, out ) );
  out.playNote( 4.5, 0.50, new ToneInstrument( "Db5 ", vol, disWave, out ) );
  out.playNote( 5.5, 0.5, new ToneInstrument( "F4 ", vol, disWave, out ) );
  out.playNote( 6.0, 1.0, new ToneInstrument( "Bb4 ", vol, disWave, out ) );
  out.playNote( 7.0, 0.5, new ToneInstrument( "A4 ", vol, disWave, out ) );
  out.playNote( 7.5, 0.5, new ToneInstrument( "Ab4 ", vol, disWave, out ) );
  disWave = Waves.add( new float[] { 0.5, 0.5 }, Waves.Triangle( 0.05 ), Waves.RandomSquare( 3 ) );
  out.playNote( 8.0, 0.25, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote( 8.25, 0.25, new ToneInstrument( "F#4 ", vol, disWave, out ) );
  out.playNote( 8.5, 0.50, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote( 9.5, 0.5, new ToneInstrument( "C4 ", vol, disWave, out ) );
  out.playNote(10.0, 1.0, new ToneInstrument( "Eb4 ", vol, disWave, out ) );
  out.playNote(11.0, 0.75, new ToneInstrument( "C4 ", vol, disWave, out ) );
  out.playNote(11.75, 0.25, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote(12.0, 1.0, new ToneInstrument( "E4 ", vol, disWave, out ) );
  out.playNote(13.0, 0.75, new ToneInstrument( "C4 ", vol, disWave, out ) );
  out.playNote(13.75, 0.25, new ToneInstrument( "G4 ", vol, disWave, out ) );
  out.playNote(14.0, 2.0, new ToneInstrument( "E4 ", vol, disWave, out ) );

  disWave = Waves.RandomSaw( 9 );
  out.playNote( 4.0, 1.9, new ToneInstrument( "Bb3 ", vol/2, disWave, out ) );
  out.playNote( 4.0, 1.9, new ToneInstrument( "F3 ", vol/2, disWave, out ) );
  //disWave = Waves.Square( 24 );
  out.playNote( 8.0, 1.9, new ToneInstrument( "C3 ", vol/2, disWave, out ) );
  out.playNote( 8.0, 1.9, new ToneInstrument( "Eb3 ", vol/2, disWave, out ) );
  out.playNote(10.0, 1.9, new ToneInstrument( "C3 ", vol, disWave, out ) );
  out.playNote(12.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );
  out.playNote(14.0, 1.9, new ToneInstrument( "E3 ", vol, disWave, out ) );








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

