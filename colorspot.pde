/*
Program name: Color Spot
 Author: Kevin Lu
 Description: Processing game to test the user's eyesight. Each level is harder than the previous one and
 the user is required to click on the square with a different color.
 */

//VARIABLES
boolean start, instructions, mouseClick, finish;
String instructions1, instructions2;
int level, startTime, score, row, col;

float[][] grid;

PImage logo;
void settings() {
  fullScreen(); //the game starts in fullscreen mode
  //size(600, 600); //for debugging
}

void setup() {
  colorMode(HSB, 255);
  startTime = 3660; //60 frames per second * 60 seconds is 3600
  score = 0; //Set the score to 0 at first
  row = 10; //Start at 2 columns
  col = 10; //Start at 2 rows
  grid = new float[row][col];
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      grid[i][j] = random(0, 255);
    }
  }
  start = false;
  mouseClick = false;
  instructions = true;
  finish = false;
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
void mousePressed() {
  mouseClick = true;
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
    rect(width/2 + 5, height/1.2 + 5, width/5, width/12);
    fill(198, 120, 254);
    rect(width/2, height/1.2, width/5, width/12);
    fill(198, 100, 150);
    textSize(92);
    text("START", width/2, height/1.16);
    fill(200, 50, 255);
    textSize(89);
    text("START", width/2, height/1.16);
    if (mousePressed && mouseX > 768 && mouseX < 1155 && mouseY > 920 && mouseY < 1084) {
      start = true;
      instructions = false;
      frameCount = 0;
    }
  }
  //If the user has clicked the start button, start the game and timer!
  if (start && !instructions) {
    background(30);
    int timer = (startTime-frameCount)/60;
    if (timer == 0) {
      timer = 0;
      start = false;
      finish = true;
    }
    strokeWeight(5);
    if (score == 0) {
      rectMode(CORNER);
      for (int i = 0; i < row-8; i++) {
        for (int j = 0; j < col-8; j++) {
          stroke(150, 250, 255);
          fill(150, 200, 255);
          rect(i*(width/4), j*(width/4), width/4, width/4, 25);
        }
      }
      fill(150, 220, 255);
      rect(0, 0, width/4, width/4, 25);
    }
    textSize(width/18);
    fill(255);
    text(timer, width/1.25, width/18);
    text("Score: " + score*10, width/1.25, width/10);
    debug();
  }
}
