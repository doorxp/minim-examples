import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
void setup()
{
  size(512, 200, P2D);
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 1024);
  //out.playNote(0.25, 0.8, new SineInstrument(115, 0.5, out));
  //out.playNote(1.20, 0.8, new SineInstrument(134, 0.5, out));
  out.setTempo( 202f );

  out.playNote(0.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(1.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(2.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(2.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(3.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(4.5, 0.4, new nowNowInstrument(349.00, 0.8, 0.6, out));
  out.playNote(5.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(6.0, 0.4, new nowNowInstrument(349.00, 0.8, 0.6, out));
  out.playNote(6.5, 0.8, new nowNowInstrument(349.22, 0.8, 1.0, out));
  
  out.playNote(8.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(9.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(9.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, out));
  out.playNote(9.67, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, out));
  out.playNote(9.83, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, out));
  out.playNote(10.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, out));
  //out.playNote(10.75, 0.1, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(11.0, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(11.33, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(11.67, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(12.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(13.0, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(13.33, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(13.67, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(14.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(15.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  
  out.playNote(16.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.6, out));
  out.playNote(17.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.6, out));
  out.playNote(17.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.6, out));
  out.playNote(17.67, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.6, out));
  out.playNote(17.83, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.7, out));
  out.playNote(18.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, out));
  out.playNote(18.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, out));
  out.playNote(19.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, out));
  out.playNote(20.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.6, 0.7, out));
  out.playNote(20.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.8, out));
  out.playNote(21.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.5, 0.8, out));
  out.playNote(21.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.8, out));
  out.playNote(22.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.4, 0.9, out));
  out.playNote(22.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.9, out));
  out.playNote(23.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.3, 0.9, out));
  out.playNote(23.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.9, out));
  
  out.playNote(24.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.96, out));
  out.playNote(25.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.96, out));
  out.playNote(25.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.96, out));
  out.playNote(25.67, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.96, out));
  out.playNote(25.83, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.97, out));
  out.playNote(26.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, out));
  out.playNote(26.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, out));
  out.playNote(27.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, out));
  out.playNote(28.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.6, 0.97, out));
  out.playNote(28.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.98, out));
  out.playNote(29.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.5, 0.98, out));
  out.playNote(29.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.98, out));
  out.playNote(30.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.4, 0.99, out));
  out.playNote(30.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.99, out));
  out.playNote(31.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.3, 0.99, out));
  out.playNote(31.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.99, out));

  //set up section marker so one can reset the numbers back to 0.0
  out.playNote(0.0, 4.0, new nowNowInstrument(87.3, 0.8, 0.3, 0.2, out));
  out.playNote(0.0, 4.0, new nowNowInstrument(43.67, 24.8, 0.2, 0.1, out));
  out.playNote(8.0, 4.0, new nowNowInstrument(87.3, 0.8, 0.3, 0.2, out));
  out.playNote(8.0, 4.0, new nowNowInstrument(43.67, 24.8, 0.2, 0.1, out));
  out.playNote(16.0, 4.0, new nowNowInstrument(87.3, 0.8, 0.3, 0.2, out));
  out.playNote(16.0, 4.0, new nowNowInstrument(43.67, 24.8, 0.2, 0.1, out));
  out.playNote(24.0, 4.0, new nowNowInstrument(87.3, 0.8, 0.3, 0.2, out));
  out.playNote(24.0, 4.0, new nowNowInstrument(43.67, 24.8, 0.2, 0.1, out));
  out.playNote(32.0, 4.0, new nowNowInstrument(87.3, 0.8, 0.3, 0.2, out));
  out.playNote(32.0, 4.0, new nowNowInstrument(43.67, 24.8, 0.2, 0.1, out));
  
  
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
}

void mouseReleased()
{
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

