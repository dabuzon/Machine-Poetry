void settings() {
  fullScreen();
}

// INITIALIZE
void setup() {
  font = createFont("Medium.otf", width/50);
  textFont(font);
  textSize(128);
  textLeading(128);
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

    // EACH TIME POINT YOU MAY ENTER A CERTAIN FUNCTION
    if (sec < 3) {
      text("DO NOT TOUCH ME I AM WRITING POETRY", width/4, width/4, width/2, height/2);
    } else if (sec >= 3 && sec < 6) {
      text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA", width/2, height/2);
    } else if (sec >= 6 && sec < 20) {
      text(poems[r], width/4, height/4, width/2, height/2);
    } else if (sec >= 20 && sec < 25) {
      text("YOU HAVE BECOME POETRY", width/2, height/2);
    } else if (sec >= 20) {
      pageIndex--;
    }
  };
}

void keyPressed() {
  if (key == '\n' && pageIndex == 1) {
    saved = typing;
    typing = "";
    pageIndex++;
    start = millis();
    r = int(random(76));
    // Need to figure out how to advance quickly
    //} else if (keyPressed && pageIndex == 2) {
    //  text("THANK YOU HAVE A NICE DAY", width/2, height/2);
  } else {
    typing = typing + key;
  }
}
