//
//  ___ ___   ___       _   _   _       ___          _                             _ 
// | __| _ ) | _ ) __ _| |_| |_| |___  | _ ) __ _ __| |____ _ _ _ ___ _  _ _ _  __| |
// | _|| _ \ | _ \/ _` |  _|  _| / -_) | _ \/ _` / _| / / _` | '_/ _ \ || | ' \/ _` |
// |___|___/ |___/\__,_|\__|\__|_\___| |___/\__,_\__|_\_\__, |_| \___/\_,_|_||_\__,_|
//                                                      |___/
//                                                                    booooooooooing!

final PApplet headsupwindow = new controlpanel();

public static class Globals {
  public static float a1 = 5; // Amplitude
  public static float f1 = .1;
  public static float speed1 = .01;
  public static String bg_num1 = "100";
  public static int dir_toggle = 1;
}

PImage imgOne;
PImage imgTwo;
PGraphics pg;
float distortion = 10; // amplitude
float speed1 = .01; // affects speed of wave scrolling
float speed2 = 40; // affects wave tightness
//float zoom = 1;
float zoom = 4.92; // Good zoom for my portable projector resolution
//float zoom = 7.6; // Good zoom for my full screen home computer resolution
final static float inc = .05;
final static short sz  = 30;

float fr = 10000;

void settings()
{
  fullScreen(2);
}

void setup()
{
  frameRate(fr);
  imgOne = loadImage("assets/"+Globals.bg_num1+".png");
  runSketch(new String[] { "My HeadsUp Window" }, headsupwindow);
}

void draw()
{
  imgOne = loadImage("assets/"+Globals.bg_num1+".png");
  movement();
}

void movement() {
  scale(zoom);
  translate(0,0);
  
  if(Globals.dir_toggle == 1)
  {
    for (int i = 0; i <imgOne.width; ++i) 
    {
      
      copy(imgOne, 0, i, width, 1, (int) (Globals.a1 * sin(Globals.f1 * i + Globals.speed1*millis())), i, width, 1);
    }
  }
  else
  {
    for (int i = 0; i <imgOne.height; ++i) 
    {
      copy(imgOne, i, 0, 1, height, i, (int) (Globals.a1 * sin(Globals.f1 * i + Globals.speed1*millis())), 1, height);
    }
  }
} 
