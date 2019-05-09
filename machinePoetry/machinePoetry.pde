import rita.*;

void settings() {
  fullScreen();
}

// INITIALIZE
void setup() {
  font = createFont("OCRB.otf", width/50);
  textFont(font);
  textSize(92);
  textLeading(92);
}

// CODE THAT RUNS FOREVER
void draw() {
  background(0);
  textAlign(CENTER);
  fill(#28FE14);

  if (pageIndex == 1) {
    text("WHAT ARE YOU? ENTER A SINGLE WORD", width/4, height/8, width/2, height/2);
    text(typing.toUpperCase(), width/2, height/1.5);
  } else if (pageIndex == 2) {
    int ms = millis() - start;
    int sec = ms/1000;

    // EACH TIME POINT YOU MAY ENTER A CERTAIN FUNCTION
    if (sec < 3) {
      text("DO NOT TOUCH ME I AM WRITING POETRY", width/4, height/2.5, width/2, height/2);
    } else if (sec >= 3 && sec < 6) {
      text("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", width/4, height/4, width/2, height/2);
    } else if (sec >= 6 && sec < 15) {
      text(standAlones[r].toUpperCase(), width/4, height/4, width/2, height/2);
      //text(inserts[r].toUpperCase(), width/4, height/4, width/2, height/2);
      text(standAlones[rTwo].toUpperCase(), width/4, height/2, width/2, height/2);
    } else if (sec >= 15 && sec < 20) {
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
    r = int(random(57));
    rTwo = int(random(57));
    // Need to figure out how to advance quickly
    //} else if (keyPressed && pageIndex == 2) {
    //  text("THANK YOU HAVE A NICE DAY", width/2, height/2);
  } else {
    typing = typing + key;
  }
}
