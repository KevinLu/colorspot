/*
Program name: Color Spot
 Author: Kevin Lu
 Description: Processing game to test the user's eyesight. Each level is harder than the previous one and
 the user is required to click on the square with a different color.
 */

//VARIABLES
boolean start, instructions, finish, mouseClick, enterScore;
String instructions1, instructions2;
int level, startTime, score, dRow, dCol, c, nameAmount;
float transparency;

int[] row;
int[] col;

int[] saturation = {100, 105, 110, 115, 120, 130, 140, 150, 160, 170, 180, 190, 191, 192, 193, 194, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195};
int[] brightness= {110, 120, 130, 140, 150, 155, 160, 165, 170, 175, 180, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195, 195};

HashMap <Integer, String> ranks = new HashMap <Integer, String>();

PImage pin;
PImage logo;
void settings() {
  fullScreen(); //the game starts in fullscreen mode
}

void setup() {
  frameRate(30);
  //Creating the highscore table
  highScores = loadTable("data/scores.csv", "header");
  highScores.addRow();
  nameAmount = highScores.getRowCount();

  row = new int[(int)Math.floor(displayHeight/100)]; //Automatically calculates the optimal grid size for screens.
  col = new int[(int)Math.floor(displayHeight/100)];
  transparency = 0;
  ratings();
  colorMode(HSB, 255);
  startTime = 60; //30 frames per second * 60 seconds is 1800
  score = 0; //Set the score to 0 at first
  for (int i = 0; i < Math.floor(displayHeight/100); i++) { //fill the arrays with values of i * 100, since 100 is the width of each square
    row[i] = i*100;
    col[i] = i*100;
  }
  dRow = (int)random(0, row.length); //randomize the row value of the different square
  dCol = (int)random(0, col.length); //randomize the col value of the different square
  c = (int)random(0, 255); //randomize the color value of the different square

  mouseClick = false;
  start = false;
  instructions = true;
  finish = false;
  instructions1 = "You have 60 seconds to click on the different colored square. Each correct answer yields 10 points and there are no penalties for incorrect answers.";
  instructions2 = "Each level becomes more difficult as you progress. When you're ready, press the start button to begin!";
  strokeWeight(0);
  logo = loadImage("colorspotLogo.png");
  pin = loadImage("pushpin.png");
}

void debug() {
  fill(255);
  textSize(32);
  text("X: "+mouseX+"Y: "+mouseY, 120, 32);
}

//void mouseClicked () {
//  if (mouseX > row[dRow] && mouseX < row[dRow] + 100 && mouseY > col[dCol] && mouseY < col[dCol] + 100) {
//    mouseClick = true;
//  } else {
//    mouseClick = false;
//  }
//}

void mainGame () {
  colorMode(HSB, 255);
  fill(c, 200, 200);
  stroke(c, 255, 150);
  strokeWeight(5);
  for (int r = 0; r < row.length; r++) {
    for (int c = 0; c < col.length; c++) {
      rect(row[r], col[c], 100, 100, 20);
    }
  }
  fill(c, saturation[constrain(score, score, 200)/10], brightness[constrain(score, score, 200)/10]);
  rect(row[dRow], col[dCol], 100, 100, 20);
}

void refresh () {
  dRow = (int)random(0, row.length);
  dCol = (int)random(0, col.length);
  c = (int)random(0, 255);
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
    fill(250);
    text("By: Kevin Lu", width/2, height/5);
    fill(30);
    text(instructions1, width/2, height/1.9, width/2, height/2);
    textSize(35);
    text(instructions2, width/2, height/1.4, width/2, height/2);
    pin.resize(0, 45);
    image(pin, width/2, height/4.1);
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
    image(pin, width/2.5, height/1.325);
    if (mousePressed && mouseX > 768 && mouseX < 1155 && mouseY > 920 && mouseY < 1084) {
      start = true;
      instructions = false;
      frameCount = 0;
    }
  }
  //If the user has clicked the start button, start the game and timer!
  if (start && !instructions) {
    background(30);
    int timer = (startTime-frameCount)/30;
    if (timer == 0) {
      timer = 0;
      start = false;
      finish = true;
    }
    rectMode(CORNER);
    mainGame();
    if (mousePressed && mouseX > row[dRow] && mouseX < row[dRow] + 100 && mouseY > col[dCol] && mouseY < col[dCol] + 100) {
      mouseClick = false;
      score += 10;
      refresh();
    }
    strokeWeight(5);
    rect(width/1.525, width/25, width/3.5, height/8);
    rect(width/1.525, width/3.48, width/3.5, height/12);
    textSize(width/18);
    fill(255);
    text("Time: " + timer, width/1.25, width/3);
    text("Score: " + score, width/1.25, width/10);
  }
  if (finish) { //when the timer hits 0, display this screen.
    for (int i = 0; i < 3; i++) { //Updating the "transparency" value for the fading effect
      transparency += 0.5;
    }
    fill(35, transparency);
    rectMode(CORNER);
    rect(0, 0, width, height);
    strokeWeight(0);
    fill(250);
    textSize(150);
    text("Time is up!", width/2, height/3);
    textSize(100);
    fill(5, 255, 200);
    text("Final score: "+score, width/2, height/2);
    fill(50, 255, 200);
    text("Rating: "+ranks.get(score/10), width/2, height/1.5);
    //Exit button
    rectMode(CENTER);
    fill(150, 100, 200);
    rect(width/3 + 5, height/1.2 + 5, width/5, width/12);
    fill(148, 120, 254);
    rect(width/3, height/1.2, width/5, width/12);
    fill(148, 100, 150);
    textSize(92);
    text("EXIT", width/3, height/1.16);
    fill(150, 50, 255);
    textSize(89);
    text("EXIT", width/3, height/1.16);
    //Highscore button
    fill(180, 100, 200);
    rect(width/1.5 + 5, height/1.2 + 5, width/5, width/12);
    fill(178, 120, 254);
    rect(width/1.5, height/1.2, width/5, width/12);
    textSize(60);
    fill(178, 100, 150);
    text("SAVE SCORE", width/1.5 + 3, height/1.16 + 3);
    fill(180, 50, 255);
    text("SAVE SCORE", width/1.5, height/1.16);
    if (mousePressed && mouseX > 447 && mouseX < 836 && mouseY > 920 && mouseY < 1084) { //Checking if EXIT is pressed
      exit();
    }
    if (mousePressed && mouseX > 1088 && mouseX < 1475 && mouseY > 920 && mouseY < 1084) { //Checking if Save Score is pressed
      finish = false;
      enterScore = true;
    }
  }
  if (enterScore) {
    highscoreBox();
  }
  debug();
}
