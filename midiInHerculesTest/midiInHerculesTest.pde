//This program only runs inside the
// Processing IDE, not in the browser.

import themidibus.*;
float y;
float z;
float c;

MidiBus myBus;

void setup() {
  size(400, 400);
  background(255);

  // List all our MIDI devices
  MidiBus.list();

  // Connect to one of the devices
  myBus = new MidiBus(this, 3, 0);
}
void draw() {
  background(255);
  stroke(0);
    line(0, y, width, y);
    line(0, z, width, z);
    noStroke();
    fill(0,c);
    ellipse(width/2,height/2,40,40);
    fill(0,255-c);
    rect(width/2-100,height/2,40,40);
}
// This function is called each time a knob, slider or button is pressed
// in the MIDI controller. It's up to us to do something interesting
// with the received values.
void controllerChange(int channel, int number, int value) {
  // Here we print the controller number.
  print("number = " + number + " ");
  println("value = " + value);
  // If we turn knob with id 104, draw a line
  // The vertical position of the line depends on how much we turn the knob
  switch(number){
    case 64:
      y = map(value, 0, 127, 0, height);  
      break;
    case 54:
      z = map(value, 0, 127, 0, height);
      break;
    case 48:
      c = map(value, 1, 127, 0, 255);
  }
  
  if(number == 64) {
    y = map(value, 0, 127, 0, height);
  }
  
  if(number == 54){
    z = map(value, 0, 127, 0, height);
  }
  
  if(number == 48){
    c = map(value, 1, 127, 0, 255);
  }
  
  // If we turn knob with id 103, draw a circle
  // The size of the circle depends on how much we turn the knob
  //if(number == 64) {
  //  ellipse(width/2, height/2, value*2, value*2);
  //}
}