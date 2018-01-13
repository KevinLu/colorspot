/*
Program name: Color Spot
 Author: Kevin Lu
 Description: Processing game to test the user's eyesight. Each level is harder than the previous one and
 the user is required to click on the square with a different color.
 */

//VARIABLES
boolean start, instructions, finish;
String instructions1, instructions2;
int level, startTime, score, dRow, dCol, c;

int[] row;
int[] col;

HashMap <Integer, String> ranks = new HashMap <Integer, String>();

PImage logo;
void settings() {
  fullScreen(); //the game starts in fullscreen mode
}

void setup() {
  row = new int[(int)Math.floor(displayHeight/100)]; //Automatically calculates the optimal grid size for screens.
  col = new int[(int)Math.floor(displayHeight/100)];
  colorMode(HSB, 255);
  startTime = 420; //60 frames per second * 60 seconds is 3600
  score = 0; //Set the score to 0 at first
  //Adding "ranks" based on final score
  ranks.put(0, "AFK");
  ranks.put(1, "One Hit Wonder");
  ranks.put(2, "What are colors?");
  ranks.put(3, "My eyes hurt");
  ranks.put(4, "Below Average");
  ranks.put(5, "Average");
  ranks.put(6, "Above Average");
  ranks.put(7, "Super Eyesight");
  ranks.put(8, "Inhuman Reactions");
  ranks.put(9, "Better than developer");
  ranks.put(10, "Discrepancy Detected...");
  ranks.put(11, "You're too good!");
  ranks.put(12, "Cheating?");
  for (int i = 0; i < Math.floor(displayHeight/100); i++) { //fill the arrays with values of i * 100, since 100 is the width of each square
    row[i] = i*100;
    col[i] = i*100;
  }
  dRow = (int)random(0, row.length); //randomize the row value of the different square
  dCol = (int)random(0, col.length); //randomize the col value of the different square
  c = (int)random(0, 255); //randomize the color value of the different square

  start = false;
  instructions = true;
  finish = false;
  instructions1 = "You have 60 seconds to click on the different colored square. Each correct answer yields 10 points and there are no penalties for incorrect answers. Clicking only on correct squares increase your multiplier.";
  instructions2 = "Each level becomes more difficult as you progress. When you're ready, press the start button to begin!";
  strokeWeight(0);
  logo = loadImage("colorspotLogo.png");
}

void debug() {
  fill(255);
  textSize(12);
  text("X: "+mouseX+"Y: "+mouseY, 38, 12);
}

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
    fill(30);
    text(instructions1, width/2, height/1.9, width/2, height/2);
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
    rectMode(CORNER);
    mainGame();
    if (score == 0) {
      fill(c, 100, 150);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 10) {
      fill(c, 110, 160);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 20) {
      fill(c, 150, 170);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 30) {
      fill(c, 160, 180);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 40) {
      fill(c, 170, 185);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 50) {
      fill(c, 180, 188);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 60) {
      fill(c, 185, 190);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 70) {
      fill(c, 188, 193);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 80) {
      fill(c, 189, 195);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score == 90) {
      fill(c, 192, 198);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (score >= 100) {
      fill(c, 196, 199);
      rect(row[dRow], col[dCol], 100, 100, 20);
    }
    if (mousePressed && mouseX > row[dRow] && mouseX < row[dRow] + 100 && mouseY > col[dCol] && mouseY < col[dCol] + 100) {
      score += 10;
      refresh();
    }
    strokeWeight(5);
    textSize(width/18);
    fill(255);
    text(timer, width/1.25, width/18);
    text("Score: " + score, width/1.25, width/10);
  }
  if (finish) { //when the timer hits 0, display this screen.
    background(30);
    fill(250);
    textSize(150);
    text("Time is up!", width/2, height/3);
    textSize(100);
    fill(5, 255, 200);
    text("Final score: "+score, width/2, height/2);
    fill(50, 255, 200);
    text("Rank: "+ranks.get(score/10), width/2, height/1.5);
    //Exit button
    fill(198, 100, 200);
    rect(width/2 + 5, height/1.2 + 5, width/5, width/12);
    fill(198, 120, 254);
    rect(width/2, height/1.2, width/5, width/12);
    fill(198, 100, 150);
    textSize(92);
    text("EXIT", width/2, height/1.16);
    if (mousePressed && mouseX > 768 && mouseX < 1155 && mouseY > 920 && mouseY < 1084) {
      exit();
    }
  }
  debug();
}
