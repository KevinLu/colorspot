int[] row = new int[10];
int[] col = new int[10];
int dRow;
int dCol;
int c;
void setup () {
  for (int i = 0; i < 10; i++) {
    row[i] = i*100;
    col[i] = i*100;
  }
  dRow = (int)random(0, row.length);
  dCol = (int)random(0, col.length);
  c = (int)random(0, 255);
}

void settings () {
  size(1000, 1000);
}

void mainGame () {
  colorMode(HSB, 255);
  fill(c, 200, 200);
  for (int r = 0; r < row.length; r++) {
    for (int c = 0; c < col.length; c++) {
      rect(row[r], col[c], 100, 100, 10);
    }
  }
  fill(c, 150, 200);
  rect(row[dRow], col[dCol], 100, 100, 10);
}

void refresh () {
  dRow = (int)random(0, row.length);
  dCol = (int)random(0, col.length);
  c = (int)random(0, 255);
}
void draw () {
  mainGame();
  if (mousePressed && mouseX > row[dRow] && mouseX < row[dRow] + 100 && mouseY > col[dCol] && mouseY < col[dCol] + 100) { 
    refresh();
  }
}
