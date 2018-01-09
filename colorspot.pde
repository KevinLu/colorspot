/*
Program name: Color Spot
 Author: Kevin Lu
 Description: Processing game to test the user's eyesight. Each level is harder than the previous one and
 the user is required to click on the square with a different color.
 */

//VARIABLES
boolean start;
boolean instructions;
float startColor;
int level;
int startTime;
void settings() {
  fullScreen(); //the game starts in fullscreen mode
  //size(600, 600); //for debugging
}

void setup() {
  colorMode(HSB);
  startTime = 3600; //60 frames per second * 60 seconds is 3600
  start = false;
  instructions = true;
}
void debug() {
  fill(0);
  textSize(12);
  text("X: "+mouseX+"Y: "+mouseY, 38, 12);
}
//int timer = (startTime-frameCount)/60;
void draw() {
  //Since the instructions is set to true in setup, we display it here
  if (instructions) {
    background(255);
    debug();
    //"Color Spot" Title Text
    textAlign(CENTER);
    textSize(width*0.05);
    fill(0);
    text("Color Spot", width/2, height/10);
    //Instructions
    textSize(width*0.03);
    text("You have 60 seconds to click on the different colored square.\nEach correct answer yields 10 points and \nthere are no penalties for incorrect answers.", width/2, height/4);
    text("Each level becomes more difficult as you progress.\nWhen you're ready, press the start button to begin!", width/2, height/2);
    //Start Button
    rectMode(CENTER);
    fill(150);
    rect(width/2, height/1.3, width/2, height/6);
    if (startColor >= 255) {
      startColor = 0;
    } else {
      startColor += 0.5;
    }
    fill(startColor, 255, 255);
    textSize(width/9);
    text("START", width/2, height/1.19);
  }
}
