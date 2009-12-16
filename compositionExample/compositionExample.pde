import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
AudioRecorder recorder;
void setup()
{
  size(512, 200, P2D);
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 1024);
  recorder = minim.createRecorder( out, "compositionExample.wav", true );
  Wavetable baseWave = Waves.Square(3);
  Wavetable noWave = Waves.Square(0);
  recorder.beginRecord();
  
  out.setTempo( 202f );
  //-----------------------------------------------------------------
  out.setNoteOffset( 4f );

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

  //--------------------------------------------------------------------------
  out.setNoteOffset( 36f );

  out.playNote(0.0, 1.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(0.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));

  out.playNote(1.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));

  out.playNote(2.0, 0.4, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(2.0, 0.3, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));

  out.playNote(2.5, 1.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(2.5, 0.8, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));

  out.playNote(3.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(4.5, 0.3, new nowNowInstrument(349.23, 0.8, 0.3, out));
  out.playNote(5.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  
  out.playNote(6.0, 0.3, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(6.5, 0.3, new nowNowInstrument(349.23, 0.8, 0.3, out));
  out.playNote(7.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));
  
  out.playNote(8.0, 1.0, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(8.0, 1.0, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));

  out.playNote(10.0, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(10.5, 0.7, new nowNowInstrument(349.23, 0.8, 1.0, out));

  out.playNote(11.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));

  out.playNote(12.5, 0.9, new nowNowInstrument(349.23, 0.8, 1.0, out));

  out.playNote(13.5, 0.3, new nowNowInstrument(349.23, 0.8, 1.0, out));
  //out.playNote(13.75, 0.3, new nowNowInstrument(349.23, 0.8, 0.3, out));
  out.playNote(14.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));

  //out.playNote(14.75, 0.3, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(15.0, 0.3, new nowNowInstrument(349.23, 0.8, 0.8, out));
  //out.playNote(15.25, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, out));

  out.playNote(16.0, 1.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(16.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
  
  out.playNote(16.5, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.6, out));
  out.playNote(17.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.6, out));
  out.playNote(17.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.6, out));
  out.playNote(17.67, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.6, out));
  out.playNote(17.83, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.7, out));
  out.playNote(18.0, 0.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(18.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
  //out.playNote(18.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, out));
  out.playNote(18.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, out));
  out.playNote(19.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, out));
  out.playNote(20.0, 3.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(20.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
  //out.playNote(20.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.6, 0.7, out));
  out.playNote(20.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.8, out));
  out.playNote(21.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.5, 0.8, out));
  out.playNote(21.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.8, out));
  out.playNote(22.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.4, 0.9, out));
  out.playNote(22.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.9, out));
  out.playNote(23.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.3, 0.9, out));
  out.playNote(23.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.9, out));
  
  out.playNote(24.0, 1.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(24.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
  
  out.playNote(24.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.96, out));
  out.playNote(25.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.96, out));
  out.playNote(25.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.96, out));
  out.playNote(25.67, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.96, out));
  out.playNote(25.83, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.97, out));
  out.playNote(26.0, 1.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(26.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
  
  //out.playNote(26.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, out));
  out.playNote(26.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, out));
  out.playNote(27.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, out));
  out.playNote(28.0, 0.8, new PooWahInstrument(0.2, 133.3, 34.65, baseWave, out));
  out.playNote(28.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.018, out));
  //out.playNote(28.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.6, 0.97, out));
  out.playNote(28.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.98, out));
  out.playNote(29.0, 0.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(29.0, 0.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
  //out.playNote(29.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.5, 0.98, out));
  out.playNote(29.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.98, out));
  out.playNote(30.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.99, out));
  out.playNote(31.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.3, 0.99, out));
  out.playNote(31.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.99, out));
 
  //---------------------------------------------------------------------------------
  out.setNoteOffset( 68f );

  for( int i=0; i<4; i++)
  {
  out.playNote(i*8+0.0, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
  
  out.playNote(i*8+1.0, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));
  
  out.playNote(i*8+2.0, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
  
  out.playNote(i*8+2.5, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));
  
  out.playNote(i*8+3.5, 0.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
  out.playNote(i*8+4.5, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));

  out.playNote(i*8+5.0, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));

  out.playNote(i*8+6.0, 0.4, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
  out.playNote(i*8+6.5, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));

  out.playNote(i*8+7.0, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));
  }
  
  out.playNote(0.0, 7.0, new BrapInstrument(0.08, 349.23, 0.020, 0.003, out));
  out.playNote(7.0, 1.0, new BrapInstrument(0.08, 349.23, 0.010, 0.0015, out));
  out.playNote(8.0, 7.0, new BrapInstrument(0.08, 349.23, 0.012, 0.011, out));
  out.playNote(15.0, 1.0, new BrapInstrument(0.08, 349.23, 0.010, 0.0015, out));
  out.playNote(16.0, 7.0, new BrapInstrument(0.08, 349.23, 0.018, 0.005, out));
  out.playNote(23.0, 1.0, new BrapInstrument(0.08, 349.23, 0.010, 0.0015, out));
  out.playNote(24.0, 7.0, new BrapInstrument(0.16, 349.23, 0.004, 0.019, out));
  out.playNote(31.0, 1.0, new BrapInstrument(0.08, 349.23, 0.010, 0.0015, out));

  //-----------------------------------------------------------------------------
  out.setNoteOffset( 100f );

  for( int i=0; i<4; i++)
  {
    out.playNote(i*8+0.0, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
    out.playNote(i*8+0.0, 1.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
    
    out.playNote(i*8+1.0, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));
  
    out.playNote(i*8+2.0, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
    out.playNote(i*8+2.0, 1.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
  
    if (( 0 == i ) || ( 2 == i ) )
    {
      out.playNote(i*8+3.0, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));
    }
  
   // out.playNote(i*8+3.5, 0.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
    out.playNote(i*8+4.5, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
    out.playNote(i*8+4.5, 1.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
   
    out.playNote(i*8+5.0, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));
  
    out.playNote(i*8+6.0, 0.4, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
    out.playNote(i*8+6.5, 1.7, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));
   
    //out.playNote(i*8+6.5, 1.8, new PooWahInstrument(0.4, 133.3, 43.65, baseWave, out));
  
    out.playNote(i*8+7.0, 0.2, new PooWahInstrument(0.5, 233.3, 1396.91, noWave, out));
  }

  float bc = 4.0;
  out.playNote(0.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(0.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(1.5, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(2.5, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(3.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(4.0, 0.4, new nowNowInstrument(349.00, 0.8, 0.9, 0.5, bc, out));
  out.playNote(5.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(6.5, 0.8, new nowNowInstrument(349.00, 0.8, 0.8, 0.5, bc, out));
  out.playNote(7.5, 0.4, new nowNowInstrument(349.22, 0.8, 1.0, 0.5, bc, out));
  
  out.playNote(8.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(8.5, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(9.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.5, bc, out));
  out.playNote(9.67, 0.8, new nowNowInstrument(349.00, 0.8, 0.5, 0.5, bc, out));
  out.playNote(9.83, 0.8, new nowNowInstrument(349.23, 0.8, 0.5, 0.5, bc, out));
  out.playNote(10.0, 0.8, new nowNowInstrument(349.63, 0.8, 1.0, 0.5, bc, out));
  //out.playNote(10.75, 0.1, new nowNowInstrument(349.23, 0.8, 1.0, out));
  out.playNote(11.0, 0.9, new nowNowInstrument(698.46, 0.7, 0.7, 1.0, 2.7, out));
  //out.playNote(11.33, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  //out.playNote(11.67, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(12.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(13.0, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(13.33, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(13.67, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(14.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  out.playNote(15.0, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.5, bc, out));
  
  bc = 3.5;
  out.playNote(16.0, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.6, bc, out));
  out.playNote(17.5, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.6, bc, out));
  //out.playNote(17.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.6, bc, out));
  //out.playNote(18.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, bc, out));
  out.playNote(18.5, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, bc, out));
  out.playNote(19.5, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.7, bc, out));
  out.playNote(20.0, 0.2, new nowNowInstrument(349.23, 0.8, 0.6, 0.7, bc, out));
  out.playNote(20.5, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.8, bc, out));
  //out.playNote(21.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.5, 0.8, bc, out));
  out.playNote(21.5, 1.8, new nowNowInstrument(350.03, 0.8, 1.0, 0.8, bc, out));
 // out.playNote(22.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.4, 0.9, bc, out));
  out.playNote(22.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.9, bc, out));
  //out.playNote(23.0, 0.6, new nowNowInstrument(349.23, 0.8, 0.3, 0.9, bc, out));
  out.playNote(23.5, 0.2, new nowNowInstrument(349.23, 0.8, 1.0, 0.9, bc, out));
  
  bc = 3.0;
  out.playNote(24.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.96, bc, out));
  out.playNote(25.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.96, bc, out));
  out.playNote(25.5, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.96, bc, out));
//  out.playNote(25.67, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.96, bc, out));
 // out.playNote(25.83, 0.1, new nowNowInstrument(349.23, 0.8, 0.5, 0.97, bc, out));
//  out.playNote(26.0, 0.4, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, bc, out));
  out.playNote(26.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, bc, out));
  out.playNote(27.5, 0.8, new nowNowInstrument(349.23, 0.8, 1.0, 0.97, bc, out));
  out.playNote(28.0, 1.6, new nowNowInstrument(349.03, 0.8, 1.6, 0.97, bc, out));
  out.playNote(28.5, 1.0, new nowNowInstrument(349.23, 0.8, 1.0, 0.98, bc, out));
  out.playNote(29.0, 0.6, new nowNowInstrument(349.99, 0.8, 1.5, 0.98, bc, out));
  out.playNote(29.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.98, bc, out));
//  out.playNote(30.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.4, 0.99, bc, out));
  out.playNote(30.5, 1.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.99, bc, out));
  
  
  //out.playNote(31.0, 0.6, new nowNowInstrument(349.23, 0.8, 1.3, 0.99, bc, out));
  //out.playNote(31.5, 0.6, new nowNowInstrument(349.23, 0.8, 1.0, 0.99, bc, out));

  float totLen = 0.0286;
  float endSpace = 0.01;
  float n = 16.0;
  for ( int i = 0; i < n; i++ )
  {
    float onTime = ( i/n )*( totLen - 2*endSpace ) + endSpace;
    float offTime = totLen - onTime;
    out.playNote(16+i+0.0, 0.1, new BrapInstrument(0.2, 349.23, onTime, offTime, out));
    out.playNote(16+i+0.5, 0.1, new BrapInstrument(0.2, 349.23, offTime, onTime, out));        
  }

  //-----------------------------------------------------------------------------
  out.setNoteOffset( 132f );
  //out.setNoteOffset( 36f );

  out.playNote(0.0, 7.8, new PooWahInstrument(0.2, 133.3, 43.65, baseWave, out));
  out.playNote(0.0, 3.8, new BrapInstrument(0.08, 349.23, 0.010, 0.013, out));

  out.playNote(0.0, 7.0, new nowNowInstrument(43.65, 0.8, 1.0, 0.1, out));

  out.playNote(0.05, 8.0, new BrapInstrument(0.1, 349.23, 0.1, 0.2, out));
  out.playNote(0.01, 6.0, new BrapInstrument(0.1, 349.23, 0.050, 0.05, out));
  out.playNote(0.02, 5.0, new BrapInstrument(0.1, 349.23, 0.020, 0.03, out));
  out.playNote(0.03, 4.5, new BrapInstrument(0.1, 349.23, 0.010, 0.02, out));
  out.playNote(0.04, 4.0, new BrapInstrument(0.1, 349.23, 0.005, 0.01, out));
 
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

