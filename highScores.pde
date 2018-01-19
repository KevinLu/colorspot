Table highScores;
String name = "";

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (name.length() > 0) {
      name = name.substring(0, name.length() - 1);
    }
  } else if (keyCode == DELETE) {
    name = "";
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    name = name + key;
  }
}

void highscore () {
  TableRow rowAmount = highScores.addRow();
  rowAmount.setString("name", name);
  rowAmount.setInt("score", score);
}

void leaderboard () {
  for (int i = 0; i < 5; i++) { //Updating the "transparency" value for the fading effect
    transparency += 1;
  }
  fill(35, transparency);
  rectMode(CORNER);
  rect(0, 0, width, height);
  fill(((mouseX*mouseY)/5000)%255, 255, 255);
  textSize(120);
  text("Top Players", width/2, height/6);
  int leaderboardDisplacement = 0;
  textSize(72);
  fill(250);
  for (int i = 0; i < Math.min(nameAmount, 10); i++) {
    leaderboardDisplacement += 72;
    TableRow row = highScores.getRow(i);
    text(row.getString("name"), width/3, height/5.9 + leaderboardDisplacement);
    text(row.getString("score"), width/1.5, height/5.9 + leaderboardDisplacement);
  }
  fill(((mouseX*mouseY)/5000)%255, 255, 255);
  rect(width/2, height/1.2, width/5, height/12); //Return to main menu button
  fill(255);
  text("BACK", width/2, height/1.2);
}

void highscoreBox () {
  for (int i = 0; i < 5; i++) { //Updating the "transparency" value for the fading effect
    transparency += 1;
  }
  fill(35, transparency);
  rectMode(CORNER);
  rect(0, 0, width, height);
  //"Enter your name"
  fill(255);
  textSize(72);
  text("Enter your name", width/2, height/3);
  //String name
  fill((name.length()*10)%255, 200, 255);
  textSize(100);
  text(name, width/2, height/2);
  //Save button
  rectMode(CENTER);
  rect(width/2, height/1.5, width/8, height/8);
  fill(150);
  text("Save", width/2, height/1.45);
  fill(255);
  textSize(98);
  text("Save", width/2, height/1.45);
  if (mousePressed && mouseX > 840 && mouseX < 1080 && mouseY > 725 && mouseY < 875) {
    highscore();
    saveTable(highScores, "data/scores.csv");
    finish = true;
    enterScore = false;
  }
}
