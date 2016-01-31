//This program only runs inside the
// Processing IDE, not in the browser.

import themidibus.*;
float r;
float g;
float b;

int num;
int val;

int[] Aval = new int[6];
int[] selector = new int[6];
boolean[] button = new boolean[6];

int[] id = {50, 56, 60, 53, 54, 63, 64 }; //array of midiBtn / knob ids
float[] p = new float[7]; //properties that must correspond to the ids 
float[][] pStore = new float[6][7];
int[] limit = {255, 255, 255, 400, 400, 400, 400}; //higher limit of the mapped property values



ArrayList<Circle> circles = new ArrayList<Circle>();
//Circle circle;

MidiBus myBus;


void setup() {
  size(400, 400);
  background(255);
  //circle = new Circle();
  
  for(int i = 0; i < 6; i++){
  circles.add(new Circle());
  selector[i] = i+1;
  button[i] = false;
  }
    // List all our MIDI devices
  MidiBus.list();

  // Connect to one of the devices
  myBus = new MidiBus(this, 3, 0);
}


void draw() {
  background(255);
  for(Circle c : circles){
   c.display();
  }
  
  for (int i = 0; i < circles.size(); i++) {
  if(num == selector[i]){
    Aval[i] = val;
    if(Aval[i] > 50){
    button[i] = true;
    } else{
    button[i] = false;
    }
  }
    if(button[i] == true){
  for(int j = 0 ; j < 7; j++){
      pStore[i][j] = p[j];   
  }
  Circle C = circles.get(i);
  C.update(pStore[i][0], pStore[i][1], pStore[i][2], pStore[i][3], pStore[i][4], pStore[i][5], pStore[i][6] );
    }
  }

  println(pStore[0]);
  println(pStore[1]);
  println(pStore[2]);
}

// This function is called each time a knob, slider or button is pressed in the MIDI controller. 

void controllerChange(int channel, int number, int value) {
  // Here we print the controller number.
  //print("number = " + number + " ");
  //print("value = " + value + " ");

  num = number;
  val = value;

  for (int i = 0; i<id.length; i++) {
    if (number == id[i]) {
      p[i] = map(value, 0, 127, 0, limit[i]);
    }
  }
}