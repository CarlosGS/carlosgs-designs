//--------------------------------------------------------------
//-- MicroHexapod controller http://www.thingiverse.com/thing:34796
//--
//-- Uses the ArduSnake oscillator library by Juan Gonzalez-Gomez 
//-- https://github.com/Obijuan/ArduSnake
//-----------------------------------------------------------
//-- Description: Movement patterns demo for MicroHexapod robot
//--------------------------------------------------------------
//-- (c) Carlos Garcia-Saura (Carlosgs), November-2012
//-- CC-BY-SA license
//--------------------------------------------------------------
#include <Servo.h>
#include <Oscillator.h>

//-- Declare the oscillators
Oscillator osc_middle, osc_right, osc_left;

//-- Global parameters for the oscillators
unsigned int A=40; // Amplitude (higher -> longer steps) set 10-40
unsigned int T=5000; // Period (lower -> faster moves)

void setup()
{
  delay(1000); // Small startup delay, replace with start-button press (if present)
  
  //-- Attach the oscillators to the servos
  osc_middle.attach(2); // 2,3 and 4 are the digital pins
  osc_right.attach(3);
  osc_left.attach(4);
  
  //-- Set the parameters
  osc_middle.SetO(-15); // Correction for the offset of the servos
  osc_right.SetO(-20);
  osc_left.SetO(25);
  
  osc_middle.SetA(15); // Middle motor needs a small amplitude (5-10)
  osc_right.SetA(A);
  osc_left.SetA(A);
  
  osc_middle.SetT(T); // Set the period of work
  osc_right.SetT(T);
  osc_left.SetT(T);
  
  //-- Refresh the oscillators
  osc_middle.refresh();
  osc_right.refresh();
  osc_left.refresh();

  //-- Set the phase difference
  //-- This defines the type of movement the robot makes
  osc_middle.SetPh(DEG2RAD( 90 ));
  osc_left.SetPh(  DEG2RAD( 0 )); 
  osc_right.SetPh( DEG2RAD( 0 )); // For example, putting 180 here will make the robot spin clockwise

}

void loop()
{
  unsigned long time;
  time = millis(); // We use this to determine the duration of the movements
  
  if(time < 10000) { // First the robot will move forward with an acceleration
    T = map(time,1000,10000,5000,1000);
    osc_middle.SetT(T); // Set the period of work (each time lower, from T=5000 to T=1000)
    osc_right.SetT(T);
    osc_left.SetT(T);
    
  } else if(time < 15000) { // Next the robot will turn clockwise
    osc_right.SetPh( DEG2RAD( 180 ));
    osc_left.SetPh( DEG2RAD( 0 ));
    
  } else if(time < 20000) { // Forward
    osc_right.SetPh( DEG2RAD( 0 ));
    osc_left.SetPh( DEG2RAD( 0 ));
    
  } else if(time < 25000) { // Counter clockwise
    osc_right.SetPh( DEG2RAD( 0 ));
    osc_left.SetPh( DEG2RAD( 180 ));
    
  } else if(time < 30000) { // Backward
    osc_right.SetPh( DEG2RAD( 180 ));
    osc_left.SetPh( DEG2RAD( 180 ));
    
  } else if(time < 35000) { // Counter clockwise
    osc_right.SetPh( DEG2RAD( 0 ));
    osc_left.SetPh( DEG2RAD( 180 ));
    
  } else if(time < 40000) { // Idle position
    osc_right.SetPh( DEG2RAD( 90 ));
    osc_left.SetPh( DEG2RAD( 90 ));
    
  } else if(time < 45000) { // Forward
    osc_right.SetPh( DEG2RAD( 0 ));
    osc_left.SetPh( DEG2RAD( 0 ));
    
  } else if(time < 55000) { // It will slowly decelerate
    T = map(time,45000,55000,1000,10000);
    osc_middle.SetT(T); // Set the period of work (each time higher, from T=1000 to T=10000)
    osc_right.SetT(T);
    osc_left.SetT(T);
    
  } else { // Until it stops, then we can stop the program
    while(1);
  }
  
  //-- Refresh the oscillators
  osc_middle.refresh();
  osc_right.refresh();
  osc_left.refresh();
}


