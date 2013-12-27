//--------------------------------------------------------------
//-- MicroHexapod controller example http://www.thingiverse.com/thing:34796
//--
//-- Uses the ArduSnake oscillator library by Juan Gonzalez-Gomez 
//-- https://github.com/Obijuan/ArduSnake
//-----------------------------------------------------------
//-- Layer: Oscillator
//------------------------------------------------------------
//-- Example of use of the Oscillator layer
//--
//-- MOD Example 5: A mini-wave is used for the locomotion of
//-- a three modules worm robot
//--------------------------------------------------------------
//-- (c) Carlos Garcia-Saura (Carlosgs), November-2012
//-- CC-BY-SA license
//--------------------------------------------------------------
#include <Servo.h>
#include <Oscillator.h>

//-- Declare the oscillators
Oscillator osc_middle, osc_right, osc_left;

//-- Global parameters for the oscillators
const int A=30; // Amplitude (higher -> longer steps) set 10-40
const int T=1000; // Period (lower -> faster moves)

void setup()
{
  delay(1000); // Small startup delay, replace with start-button press (if present)
  
  //-- Attach the oscillators to the servos
  osc_middle.attach(2); // 2,3 and 4 are the digital pins
  osc_right.attach(3);
  osc_left.attach(4);
  
  //-- Set the parameters
  osc_middle.SetO(-17); // Correction for the offset of the servos
  osc_right.SetO(-20);
  osc_left.SetO(0);
  
  osc_middle.SetA(5); // Middle motor needs a small amplitude (5-10)
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
  //-- Refresh the oscillators
  osc_middle.refresh();
  osc_right.refresh();
  osc_left.refresh();
}


