/*
Program name: Color Spot
 Author: Kevin Lu
 Description: Processing game to test the user's eyesight. Each level is harder than the previous one and
 the user is required to click on the square with a different color.
 */

//VARIABLES
boolean start;
boolean instructions;
int level;
int startTime;
void settings() {
  fullScreen(); //the game starts in fullscreen mode
}

void setup() {
  startTime = 3600; //60 frames per second * 60 seconds is 3600
  start = false;
  instructions = true;
}
  //int timer = (startTime-frameCount)/60;
void draw() {
  //Since the instructions is set to true in setup, we display it here
  if (instructions) {
    background(255);
    //"Color Spot" Title Text
    textAlign(CENTER);
    textSize(width*0.05);
    fill(0);
    text("Color Spot", width/2, height/10);
    //Instructions
    textSize(width*0.03);
    text("instructions text 1 here", width/2, height/4);
    text("instructions text 2 here", width/2, height/2);
  }
}
