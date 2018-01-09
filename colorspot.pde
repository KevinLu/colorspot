/*
Program name: Color Spot
 Author: Kevin Lu
 Description: Processing game to test the user's eyesight. Each level is harder than the previous one and
 the user is required to click on the square with a different color.
 */

//VARIABLES
boolean start;
boolean instructions;
String instructions1;
String instructions2;
int level;
int startTime;

PImage logo;
void settings() {
  fullScreen(); //the game starts in fullscreen mode
  //size(600, 600); //for debugging
}

void setup() {
  colorMode(HSB, 255);
  startTime = 3600; //60 frames per second * 60 seconds is 3600
  start = false;
  instructions = true;
  instructions1 = "You have 60 seconds to click on the different colored square. Each correct answer yields 10 points and there are no penalties for incorrect answers.";
  instructions2 = "Each level becomes more difficult as you progress. When you're ready, press the start button to begin!";
  strokeWeight(0);
  logo = loadImage("colorspotLogo.png");
}
void debug() {
  fill(255);
  textSize(12);
  text("X: "+mouseX+"Y: "+mouseY, 38, 12);
}
//int timer = (startTime-frameCount)/60;
void draw() {
  //Since the instructions is set to true in setup, we display it here
  if (instructions) {
    background(30);
    debug();
    //"Color Spot" Title Text
    image(logo, 0, 0);
    //Instructions Background Shapes
    rectMode(CENTER);
    fill(25, 186, 254);
    rect(width/2 + 5, height/2.4 + 5, width/2, height/3);
    fill(25, 120, 254);
    rect(width/2, height/2.4, width/2, height/3);
    //Instructions
    textSize(32);
    textAlign(CENTER);
    fill(30);
    text(instructions1, width/2, height/1.8, width/2, height/2);
    textSize(35);
    text(instructions2, width/2, height/1.4, width/2, height/2);
    //Start button
    fill(198, 100, 200);
    rect(width/2 + 5, height/1.2 + 5, width/5, width/12, width/5);
    fill(198, 120, 254);
    rect(width/2, height/1.2, width/5, width/12, width/5);
  }
}
