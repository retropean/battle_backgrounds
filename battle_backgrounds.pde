//
//  ___ ___   ___       _   _   _       ___          _                             _ 
// | __| _ ) | _ ) __ _| |_| |_| |___  | _ ) __ _ __| |____ _ _ _ ___ _  _ _ _  __| |
// | _|| _ \ | _ \/ _` |  _|  _| / -_) | _ \/ _` / _| / / _` | '_/ _ \ || | ' \/ _` |
// |___|___/ |___/\__,_|\__|\__|_\___| |___/\__,_\__|_\_\__, |_| \___/\_,_|_||_\__,_|
//                                                      |___/
//

//final PApplet headsupwindow = new HeadsUp();
final PApplet headsupwindow = new controlpanel();

public static class Globals {
  public static float a = 5; // Amplitude
  public static float f = .1;
  public static float speed = .01;
}
PImage imgOne;
PImage imgTwo;
PGraphics pg;
float distortion = 10; // amplitude
float speed1 = .01; // affects speed of wave scrolling
float speed2 = 40; // affects wave tightness
float zoom = 1;
//float zoom = 7.6;
final static float inc = .05;
final static short sz  = 30;

//float a = 5;
//float f = .1;
float fr = 10000;
//float speed = .01;

void settings()
{
  fullScreen(2);
}

void setup()
{
  frameRate(fr);
  
  
  
  imgOne = loadImage("assets/007.png");
  //println(imgOne.pixels[1]);
  
  imgTwo = loadImage("assets/004.png");
  runSketch(new String[] { "My HeadsUp Window" }, headsupwindow);
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
    copy(imgOne, i, 0, 1, height, i, (int) (Globals.a * sin(Globals.f * i + Globals.speed*millis())), 1, height);
  }
  for (int i = 0; i <imgTwo.height; ++i) 
  {
    copy(imgTwo, i, 0, 1, height, i, (int) (Globals.a * sin(Globals.f * i + Globals.speed*millis())), 1, height);
  }
  //Diagnostics
  //println("Zoom level: " + zoom);
  //println("Framerate: " + frameRate);
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

import controlP5.*;
import java.util.*;




public static final class controlpanel extends PApplet
{ 
  ControlP5 cp5;
  
  void setup() {
    cp5 = new ControlP5(this);
    int[] imgnum = new int[327];
    int myColorBackground = color(0,0,0);
    int colorMin = 100;
    int colorMax = 100;
    Range range;
    
    for (int i = 1; i <= 326; i++)
    {
      println(i);
      imgnum[i] = i;
    }
        
    // Range controller
    cp5 = new ControlP5(this);
    range = cp5.addRange("rangeController")
       // disable broadcasting since setRange and setRangeValues will trigger an event
       .setBroadcast(false) 
       .setPosition(10,100)
       .setSize(400,40)
       .setHandleSize(20)
       .setRange(0,255)
       .setRangeValues(50,100)
       // after the initialization we turn broadcast back on again
       .setBroadcast(true)
       .setColorForeground(color(255,40))
       .setColorBackground(color(255,40))  
       ;
             
  noStroke();             
    
    // Range controller
    cp5 = new ControlP5(this);
    range = cp5.addRange("rangeController2")
       // disable broadcasting since setRange and setRangeValues will trigger an event
       .setBroadcast(false) 
       .setPosition(10,170)
       .setSize(400,40)
       .setHandleSize(20)
       .setRange(0,255)
       .setRangeValues(50,100)
       // after the initialization we turn broadcast back on again
       .setBroadcast(true)
       .setColorForeground(color(255,40))
       .setColorBackground(color(255,40))  
       ;
             
  noStroke();  
  
    // Range controller
    cp5 = new ControlP5(this);
    range = cp5.addRange("rangeController3")
       // disable broadcasting since setRange and setRangeValues will trigger an event
       .setBroadcast(false) 
       .setPosition(10,240)
       .setSize(400,40)
       .setHandleSize(20)
       .setRange(0,255)
       .setRangeValues(50,100)
       // after the initialization we turn broadcast back on again
       .setBroadcast(true)
       .setColorForeground(color(255,40))
       .setColorBackground(color(255,40))  
       ;
             
  noStroke(); 
    
    // Dropdown
    cp5.addScrollableList("dropdown")
       .setPosition(10, 40)
       .setSize(200, 100)
       .setBarHeight(20)
       .setItemHeight(20)
       .addItems(str(imgnum))
       // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
       ; 
  }
  
  
  public void settings() {
    size(400, 400);
  }
  
  void draw() {
    background(0);
    textSize(10);
    text("Background Number", 10, 30);
    
    text("Amplitude", 10, 100);
    
    text("Frequency", 10, 170);
    
    text("Speed", 10, 240);
  }
  
  void dropdown(int n) {
    /* request the selected item based on index n */
    println(n, cp5.get(ScrollableList.class, "dropdown").getItem(n));
    
    /* here an item is stored as a Map  with the following key-value pairs:
     * name, the given name of the item
     * text, the given text of the item by default the same as name
     * value, the given value of the item, can be changed by using .getItem(n).put("value", "abc"); a value here is of type Object therefore can be anything
     * color, the given color of the item, how to change, see below
     * view, a customizable view, is of type CDrawable 
     */
    
     CColor c = new CColor();
     c.setBackground(color(0,0,0));
     cp5.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);
    
  }
  
  // For the slider
  void controlEvent(ControlEvent theControlEvent) {
    if(theControlEvent.isFrom("rangeController")) {
      // min and max values are stored in an array.
      // access this array with controller().arrayValue().
      // min is at index 0, max is at index 1.
      int colorMin = 100;
      int colorMax = 100;
      colorMin = int(theControlEvent.getController().getArrayValue(0));
      colorMax = int(theControlEvent.getController().getArrayValue(1));
      println("range update, done.");
    }
  }
  
  void keyPressed() {
    switch(key) {
      case('1'):
      /* make the ScrollableList behave like a ListBox */
      cp5.get(ScrollableList.class, "dropdown").setType(ControlP5.LIST);
      break;
      case('2'):
      /* make the ScrollableList behave like a DropdownList */
      cp5.get(ScrollableList.class, "dropdown").setType(ControlP5.DROPDOWN);
      break;
      case('3'):
      /*change content of the ScrollableList */
      List l = Arrays.asList("a-1", "b-1", "c-1", "d-1", "e-1", "f-1", "g-1", "h-1", "i-1", "j-1", "k-1");
      cp5.get(ScrollableList.class, "dropdown").setItems(l);
      break;
      case('4'):
      /* remove an item from the ScrollableList */
      cp5.get(ScrollableList.class, "dropdown").removeItem("k-1");
      break;
      case('5'):
      /* clear the ScrollableList */
      cp5.get(ScrollableList.class, "dropdown").clear();
      break;
    }
  }
}
/*
public static final class HeadsUp extends PApplet
{ 
  PFont saturn_boing;
  void setup() 
  {
    textAlign(LEFT, CENTER);
    
  }
  void settings() 
  {
    size(700, 500);
    smooth(4);
  }
  void draw() 
  {
    background(0);
    textSize(10);
    text("Background Number", 10, 30);
    
    text("Amplitude", 10, 100);
    
    text("Frequency", 10, 170);
    
    text("Speed", 10, 240);
    
  }
}
*/
