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

void highscore (int score) {

  highScores = new Table();

  highScores.addColumn("name");
  highScores.addColumn("score");

  TableRow newRow = highScores.addRow();
  newRow.setString("name", name);
  newRow.setInt("score", score);
}

void highscoreBox () {
  for (int i = 0; i < 3; i++) { //Updating the "transparency" value for the fading effect
    transparency += 0.5;
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
  if (mousePressed && mouseX > 840 && mouseX < 1080 && mouseY > 725 && mouseY < 875) {
    saveTable(highScores, "data/new.csv");
    finish = true;
    enterScore = false;
  }
}
