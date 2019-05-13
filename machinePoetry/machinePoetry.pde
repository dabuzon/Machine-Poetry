void settings() {
  fullScreen();
}

// INITIALIZE
void setup() {
  font = createFont("OCRB.otf", width/50);
  standAlones = loadStrings("standAlones.txt");
  inserts = loadStrings("inserts.txt");

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
    // TIME STARTS
    int ms = millis() - start;
    int sec = ms/1000;

    if (sec < 3) {
      text("DO NOT TOUCH ME I AM WRITING POETRY", width/4, height/2.5, width/2, height/2);
    } else if (sec >= 3 && sec < 6) {
      text("", width/4, height/4, width/2, height/2);
    } else if (sec >= 6 && sec < 15) {
      text(standAlones[r].toUpperCase(), width/4, height/4, width/2, height/2);
      text(inserts[r].toUpperCase(), width/4, height/3, width/2, height/2);
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
    saved = saved.toUpperCase();
    inputPoems = new StringList();
    typing = "";
    pageIndex++;
    start = millis();

    r = int(random(57));
    rTwo = int(random(57));

    for (int i = 0; i < standAlones.length; i++) {
      String line = standAlones[i];
      //String stLine = strip(line);
      String[] check = split(line, " ");

      for (int j = 0; j < check.length; j++) {
        String word = check[j];
        word = word.toUpperCase();
        println(word);
        if (saved.equals(word)) {
          inputPoems.append(line);
          break;
        }
      }
    }
    println(inputPoems);
  } else {
    typing = typing + key;
  }
}
