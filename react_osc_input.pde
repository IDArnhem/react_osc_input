/**
 * This sketch listens to incoming OSC messages and reacts on them.
 */
import oscP5.*;
import netP5.*;

import org.firmata.*;
import cc.arduino.*;

int listenPort = 12345;
OscP5 oscP5;

boolean bDebug = false;

// model a person in our detection system
class Person {
  public int id;
  public int oid;
  public long age;
  public PVector pos;
  
  public Person() {
    pos = new PVector();
  }
}

// keep a variable to store one person (only)
Person p;


void setup() {
  size(400,400);
 
  // start oscP5, listen for messages on port 12345
  oscP5 = new OscP5(this, listenPort);
  
  // make a Person object
  p = new Person();
  p.pos.x = 0;
  p.pos.y = 0;
}

void draw() {
  background(60);
  ellipse(p.pos.x * width, p.pos.y * height, 20, 20);
}

void mirror_move_left() {
  // use firmata to activate the arduino pins that you need to move your mirror
}

void mirror_move_right() {
  // use firmata to activate the arduino pins that you need to move your mirror
}

void mirror_move_up() {
  // use firmata to activate the arduino pins that you need to move your mirror
}

void mirror_move_down() {
  // use firmata to activate the arduino pins that you need to move your mirror
}

void keyPressed() {
  switch(key) {
    case 'd':
    case 'D':
      bDebug = !bDebug;
      break;
  }
}

/**
 * Process ANY incoming OSC message
 */
void oscEvent(OscMessage msg) 
{  
  processTSPSMessage(msg);

  // some debugging stuff to help us out when things go wrong
  if(bDebug) {
    print("OSC Message Recieved: ");
    // print the whole message
    msg.print();
  }
}

/**
 * interpret input from TSPS.
 *
 * See docu here: http://www.tsps.cc/docs/tsps-osc-protocol/
 */
void processTSPSMessage(OscMessage msg) {
  if(msg.checkAddrPattern("/TSPS/personUpdated/") == true) {
    p.id = msg.get(0).intValue();
    p.oid = msg.get(1).intValue();
    p.age = msg.get(2).intValue();
    p.pos.x = msg.get(3).floatValue();
    p.pos.y = msg.get(4).floatValue();
  }
  
  if(msg.checkAddrPattern("/TSPS/personEntered/") == true) {
    println("Person just walked into my frame. I can see clearly now.");
  }

  if(msg.checkAddrPattern("/TSPS/personWillLeave/") == true) {
    println("Person is leaving. Goodbye person!");
  }
}

/*
### note from the docu above

messages addresses:
  /TSPS/personEntered  OR 
  /TSPS/personUpdated OR 
  /TSPS/personWillLeave
  
params:
  0: pid;
  1: oid;
  2: age;
  3: centroid.x;
  4: centroid.y;
  5: velocity.x;
  6: velocity.y;
  7: depth;
*/
