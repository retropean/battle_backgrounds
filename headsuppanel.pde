// Start code for heads-up panel
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
    
    cp5.addSlider("Amplitude")
     .setPosition(10,100)
     .setSize(200,20)
     .setRange(0,10)
     .setValue(5)
     .setNumberOfTickMarks(11)
     ;
     
     //cp5.getController("slider_a").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
     //cp5.getController("slider_a").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
    cp5.addSlider("Frequency")
     .setPosition(10,170)
     .setSize(200,20)
     .setRange(-2,2)
     .setValue(.01)
     .setNumberOfTickMarks(6)
     ;
     
     //cp5.getController("slider_f").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
     //cp5.getController("slider_f").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
    cp5.addSlider("Speed")
     .setPosition(10,240)
     .setSize(200,20)
     .setRange(0,.04)
     .setValue(.01)
     ;
     
     //cp5.getController("slider_s").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
     //cp5.getController("slider_s").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    
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
    
  void Amplitude(float selected_a) {
    Globals.a = selected_a;
    //println("a slider event. setting amplitude to "+selected_a);
  }
  
  void Frequency(float selected_f) {
    Globals.f = selected_f;
    //println("a slider event. setting amplitude to "+selected_f);
  }
  
  void Speed(float selected_speed) {
    Globals.speed = selected_speed;
    //println("a slider event. setting speed to "+selected_speed);
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
     String hello = new String();
     //hello = String.valueOf(n);
     hello = nf(n,3);
     println(hello);
     Globals.bg_num = hello;;//hello = (String) cp5.get(ScrollableList.class, "dropdown").getItem(n).put("value", c);
     //cp5.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);
     //println(String.format("%03d", hello));
     //println(cp5.get(ScrollableList.class, "dropdown").getItem(n).put("value", c));
     //println(dropdown.getController().getValue());
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
