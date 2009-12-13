import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
IIRFilter filt;
Oscil osc;
Oscil cutOsc;
Constant cutoff;

void setup()
{
  size(300, 200);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  osc = new Oscil(500, 0.2, Waves.Saw);
  filt = new LowPassSP(400, out.sampleRate());
  //filt = new LowPassFS(400, out.sampleRate());
  //filt = new BandPass(400, 100, out.sampleRate());
  //filt = new HighPassSP(400, out.sampleRate());
  //filt = new NotchFilter(400, 100, out.sampleRate());
  // so we can sum the oscil with Constant, which shifts the center value of the Oscil
  Bus bus = new Bus();
  cutoff = new Constant(1000);
  cutOsc = new Oscil(1, 800, Waves.Sine);
  cutoff.patch(bus);
  cutOsc.patch(bus);  
  // hook up the modulation for the cutoff frequency of the filter
  bus.patch(filt.cutoff);
  // patch the sounding oscil to the output
  osc.patch(filt).patch(out);
}

void draw()
{
  //println("Filter cutoff is " + filt.frequency());
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
