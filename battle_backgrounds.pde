//
//  ___ ___   ___       _   _   _       ___          _                             _ 
// | __| _ ) | _ ) __ _| |_| |_| |___  | _ ) __ _ __| |____ _ _ _ ___ _  _ _ _  __| |
// | _|| _ \ | _ \/ _` |  _|  _| / -_) | _ \/ _` / _| / / _` | '_/ _ \ || | ' \/ _` |
// |___|___/ |___/\__,_|\__|\__|_\___| |___/\__,_\__|_\_\__, |_| \___/\_,_|_||_\__,_|
//                                                      |___/
//

PImage myImage;
float distortion = 10; // amplitude
float speed1 = .01; // affects speed of wave scrolling
float speed2 = 8; // affects wave tightness
PFont f; 
float zoom = 7.6;
final static float inc = .05;
final static short sz  = 30;

void settings()
{
  fullScreen(2);
}

void setup()
{
  f = createFont("Arial", 16, true);
  frameRate(35);
  myImage = loadImage("assets/001.png");
}

void draw()
{
  movement();
}

void movement() {
  println("Framerate: " + frameRate);
  image(myImage, width/2, height/2);
  rect(0, 0, width, height);
  fill(0, 0, 0);
  
  rect(0, 0, width, height);
  fill(0);

  if (mousePressed)
  {
    if      (mouseButton == LEFT)   zoom += inc;
    else if (mouseButton == RIGHT)  zoom -= inc;
  }
  //scale(zoom); // UNBLOCK FOR SCALING
  for (int i = 0; i <myImage.height; ++i) 
  {
    copy(myImage, i, 0, 1, height, i, (int) (sin((millis()+i*speed2)*speed1)*distortion), 1, height);
    //translate(width>>1, height>>1);
  }
  println("Zoom level: " + zoom);
} 