//
//  ___ ___   ___       _   _   _       ___          _                             _ 
// | __| _ ) | _ ) __ _| |_| |_| |___  | _ ) __ _ __| |____ _ _ _ ___ _  _ _ _  __| |
// | _|| _ \ | _ \/ _` |  _|  _| / -_) | _ \/ _` / _| / / _` | '_/ _ \ || | ' \/ _` |
// |___|___/ |___/\__,_|\__|\__|_\___| |___/\__,_\__|_\_\__, |_| \___/\_,_|_||_\__,_|
//                                                      |___/
//

PImage imgOne;
PImage imgTwo;
float distortion = 10; // amplitude
float speed1 = .01; // affects speed of wave scrolling
float speed2 = 40; // affects wave tightness
float zoom = 1;
//float zoom = 7.6;
final static float inc = .05;
final static short sz  = 30;

float a = 5;
float f = .1;
float fr = 10000;
float speed = .01;

void settings()
{
  fullScreen(2);
}

void setup()
{
  frameRate(fr);
  imgOne = loadImage("assets/007.png");
  //AddTransparency(imgOne, 40);
  
  imgTwo = loadImage("assets/004.png");
}

void draw()
{
  movement();
}

void movement() {
  if (mousePressed)
  {
    if      (mouseButton == LEFT)   zoom += inc;
    else if (mouseButton == RIGHT)  zoom -= inc;
  }
  
  scale(zoom);
  translate(0,0);
  
  for (int i = 0; i <imgOne.height; ++i) 
  {
    copy(imgOne, i, 0, 1, height, i, (int) (a * sin(f * i + speed*millis())), 1, height);
    
  }
  
  //Diagnostics
  println("Zoom level: " + zoom);
  println("Framerate: " + frameRate);
} 

/*
void AddTransparency(PImage pi, int transparency)
{
  transparency <<= 24;
  for (int i = 0; i < pi.width; i++)
  {
    for (int j = 0; j < pi.height; j++)
    {
  color c = pi.pixels[i + j * pi.width];
  c = c & 0x00FFFFFF | transparency;
  pi.pixels[i + j * pi.width] = c;
    }
  }
}
*/