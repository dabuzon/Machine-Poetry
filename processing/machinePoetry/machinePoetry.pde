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
    text("WHAT ARE YOU? ENTER SINGLE WORD", width/2, height/3);
    text(typing, width/2, height/2);

    if (saved = typing) {
        text("DO NOT TOUCH ME I AM WRITING POETRY", width/2, height/2);
    } else {
        typing = typing + key;
    }
}

void keyPressed() {
  if (key == '\n' ) {
    saved = typing;
    typing = "";
//   } else if (key == BACKSPACE) {
//       typing = typing.deleteCharAt(typing.length()-1);
  } else {
    typing = typing + key; 
  }
}
