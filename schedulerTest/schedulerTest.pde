import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
AudioRecorder recorder;

void setup()
{
  size(100, 100);
  
  minim = new Minim(this);
  //minim.debugOn();
  out = minim.getLineOut(Minim.STEREO, 4096);
  
  recorder = minim.createRecorder(out, "beeps.wav", false);
  recorder.beginRecord();
  
  out.setTempo(120);
  
  for(int i = 0; i < 320; i++)
  {
    float b = i;
    out.playNote(b, 0.1, new BeepInstrument(out));
    out.playNote(b+0.25, 0.1, new BeepInstrument(out));
    out.playNote(b+0.5, 0.1, new BeepInstrument(out));
    out.playNote(b+0.75, 0.1, new BeepInstrument(out));
  }
}

void draw()
{
  background(0);
}

void keyPressed()
{
  recorder.endRecord();
  recorder.save();
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}
