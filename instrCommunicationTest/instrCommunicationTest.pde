import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
FollowInstrument myFollow;

void setup()
{
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 1024);

  myFollow = new FollowInstrument( 0.5, 87.3, 1.0, 0.150, out ); 
  out.playNote( 0.0, 10.6, myFollow );
  
  float lVol = 0.4;
  out.playNote( 1.0, 1.4, new LeaderInstrument( lVol, 174.61, myFollow, out ) );  
  out.playNote( 2.5, 0.4, new LeaderInstrument( lVol, 233.08, myFollow, out ) );  
  out.playNote( 3.0, 1.4, new LeaderInstrument( lVol, 311.13, myFollow, out ) );
  
  out.playNote( 4.5, 0.4, new LeaderInstrument( lVol, 293.66, myFollow, out ) );  

  out.playNote( 5.0, 0.4, new LeaderInstrument( lVol, 233.08, myFollow, out ) );
  out.playNote( 5.5, 0.4, new LeaderInstrument( lVol, 196.00, myFollow, out ) );
  out.playNote( 6.0, 0.4, new LeaderInstrument( lVol, 261.63, myFollow, out ) );

  out.playNote( 6.5, 3.0, new LeaderInstrument( lVol, 349.23, myFollow, out ) );
  
}
