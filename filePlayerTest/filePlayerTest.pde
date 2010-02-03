import ddf.minim.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

Minim minim;
FilePlayer filePlayer;
AudioOutput out;
String fileName = "http://www.future-boy.net/audio/outofit/02_-_brad_sucks_-_certain_death_(future_boy_pulse_mix).mp3";

void setup()
{
  size(640, 480);
  
  minim = new Minim(this);

  AudioRecordingStream myFile = minim.loadFileStream( fileName, // the file to load
                                                      width,    // the size of the buffer
                                                      false     // whether to load it totally into memory or not
                                                    );
                               
  // this opens the file and puts it in the "play" state.                           
  filePlayer = new FilePlayer( myFile );
  
  out = minim.getLineOut();
  filePlayer.patch(out);
                        
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
  filePlayer.close();
  minim.stop();
  
  super.stop();
}


