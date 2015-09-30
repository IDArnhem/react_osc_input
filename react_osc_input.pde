/**
 * This sketch listens to incoming OSC messages and reacts on them.
 *
 * (cc) 2015 Luis Rodil-Fernandez for IDA Arnhem
 */
import oscP5.*;
import netP5.*;

import org.firmata.*;
import cc.arduino.*;


int listenPort = 12345;
OscP5 oscP5;

void setup() {
  size(400,400);
 
  // start oscP5, listen for messages on port 12345
  oscP5 = new OscP5(this, listenPort);
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


void oscEvent(OscMessage msg) 
{  
  // print out the message
  print("OSC Message Recieved: ");
  //print(msg.addrPattern() + " ");
  msg.print();

  /*
  int first = msg.get(0).intValue();
  float second = msg.get(1).floatValue();
  String third = msg.get(2).stringValue();
  */
}


