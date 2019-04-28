void settings() {
  fullScreen();
}

// INITIALIZE
void setup() {
  font = createFont("Medium.otf", width/50);
  textFont(font);
}

// CODE THAT RUNS FOREVER
void draw() {
  background(0);
  textAlign(CENTER);
  fill(#28FE14);

  if (pageIndex == 1) {
    text("WHAT ARE YOU? ENTER SINGLE WORD", width/2, height/3);
    text(typing, width/2, height/2);
  } else if (pageIndex == 2) {
    int ms = millis() - start;
    int sec = ms/1000;

    if (sec < 3) {
      text("DO NOT TOUCH ME I AM WRITING POETRY", width/2, height/2);
    } else if (sec >= 3) {
      text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA", width/2, height/2);
      pageIndex++;
    }
  } else if (pageIndex == 3) {
    int r = int(random(76));
    text(poems[r], width/2, height/2);
  };
}

void keyPressed() {
  if (key == '\n' && pageIndex == 1) {
    saved = typing;
    typing = "";
    pageIndex++;
    start = millis();
  } else {
    typing = typing + key;
  }
}
