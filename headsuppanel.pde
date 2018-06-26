import controlP5.*;
import java.util.*;

public static final class controlpanel extends PApplet
{ 
  ControlP5 cp5;
  
  void setup() {
    cp5 = new ControlP5(this);
    int[] imgnum = new int[327];
    
    
    for (int i = 1; i <= 326; i++)
    {
      println(i);
      imgnum[i] = i;
    }
    
    cp5.addSlider("Amplitude")
      .setPosition(10,100)
      .setSize(200,20)
      .setRange(0,20)
      .setValue(5)
      .setNumberOfTickMarks(21)
      ;
      
    cp5.addScrollableList("dropdown")
      .setPosition(10, 40)
      .setSize(200, 100)
      .setBarHeight(20)
      .setItemHeight(20)
      .addItems(str(imgnum))
      ;   
       
    cp5.addSlider("Frequency")
      .setPosition(10,170)
      .setSize(200,20)
      .setRange(-2,2)
      .setValue(.01)
      //.setNumberOfTickMarks(6)
      ;
  
    cp5.addSlider("Speed")
      .setPosition(10,240)
      .setSize(200,20)
      .setRange(0,.04)
      .setValue(.01)
      ;
     
    cp5.addButton("Direction")
      .setPosition(10,310)
      .setSize(200,19)
      .setValue(0)
      ;
      
    cp5.addButton("Mic")
      .setPosition(10,350)
      .setSize(200,19)
      .setValue(0)
      ;
  }
    
  void Amplitude(float selected_a) {
    Globals.a1 = selected_a;
  }
  
  void Frequency(float selected_f) {
    Globals.f1 = selected_f;
  }
  
  void Speed(float selected_speed) {
    Globals.speed1 = selected_speed;
  }
  
  public void settings() {
    size(400, 400);
  }
  
  void draw() {
    background(0);
    textSize(10);
    text("Background Number", 10, 30);
    text("Amplitude", 10, 90);
    text("Frequency", 10, 160);
    text("Speed", 10, 230);
  }
  
  // Background drop down
  void dropdown(int n) {
     Globals.bg_num1 = nf(n,3);
  }
  
  public void Direction(int theValue) 
  {
    if(Globals.dir_toggle == 1)
    {
      Globals.dir_toggle = 0;
    }
    else Globals.dir_toggle = 1;
  }
  
  public void Mic(int theValue) 
  {
    if(Globals.mic_toggle == 1)
    {
      Globals.mic_toggle = 0;
    }
    else Globals.mic_toggle = 1;
  }
}
