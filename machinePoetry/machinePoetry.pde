void settings() {
  fullScreen();
}

// INITIALIZE
void setup() {
  reg = createFont("book.ttf", width/50);
  italic = createFont("italic.ttf", width/50);
  standAlones = loadStrings("standAlones.txt");
  inserts = loadStrings("inserts.txt");
  noCursor();

  textFont(reg);
  textSize(48);

  inputPoems = new StringList();
  inputMiddle = new StringList();
}

// CODE THAT RUNS FOREVER
void draw() {
  background(0);
  textAlign(CENTER);
  fill(255, 255, 0);

  if (pageIndex == 1) {
    textFont(reg);
    text("Will you let me write you poetry?", width/250, height/2.25, width, height/2);
    textFont(italic);
    text("Please enter a single word below", width/4, height/2, width/2, height/2);
    text(typing + "_", width/2, height/1.5);
  } else if (pageIndex == 2) {
    textFont(reg);
    // TIME STARTS
    int ms = millis() - start;
    int sec = ms/1000;

    if (sec < 3) {
      if (inputPoems.size() >= 1) {
        text("I will now write you a poem about " + "\"" + saved.toLowerCase() + "\"", width/4, height/2.25, width/2, height/2);
      } else if (inputPoems.size() < 1) {
        text("Sorry, I do not understand the word " + "\"" + saved.toLowerCase() +  "\"", width/4, height/2.25, width/2, height/2);
        text("but I will write you a poem anyway", width/4, height/2, width/2, height/2);
      }
    } else if (sec >= 3 && sec < 6) {
      text("", width/4, height/4, width/2, height/2);
    } else if (sec >= 6 && sec < 15) {
      textFont(italic);
      text(inputPoems.get(r), width/4, height/2.25, width/2, height/2);
      text(inputMiddle.get(rIn), width/4, height/2, width/2, height/2);
      text(inputPoems.get(rTwo), width/4, height/1.8, width/2, height/2);
    } else if (sec >= 15 && sec < 20) {
      textFont(reg);
      text("Did you enjoy my poetry?", width/2, height/2);
    } else if (sec >= 20) {
      pageIndex--;
      inputPoems.clear();
      inputMiddle.clear();
    }
  };
}

void keyPressed() {
  if (key == '\n' && pageIndex == 1) {
    saved = typing;
    saved = saved.toUpperCase();
    typing = "";
    pageIndex++;
    start = millis();

    for (int i = 0; i < standAlones.length; i++) {
      String line = standAlones[i];
      //String stLine = strip(line);
      String[] check = split(line, " ");

      for (int j = 0; j < check.length; j++) {
        String word = check[j];
        word = word.toUpperCase();
        //println(word);
        if (saved.equals(word)) {
          inputPoems.append(line);
          // why is this appending multiple times
          inputMiddle.append(inserts);
          break;
        }
      }
    }

    if (inputPoems.size() < 1) {
      inputPoems.append(standAlones);
      for (int n = 0; n < inserts.length; n++) {
        String iLine = inserts[n];
        String[] iCheck = split(iLine, " ");

        for (int o = 0; o < iCheck.length; o++) {
          String iWord = iCheck[o];
          iWord = iWord.toUpperCase();
          if (saved.equals(iWord)) {
            inputMiddle.append(iLine);
            break;
          } else {
            inputMiddle.append(inserts);
            break;
          }
        }
      }
    }

    println(inputPoems);
    println(inputMiddle);

    rIn = int(random(inserts.length));
    r = int(random(inputPoems.size()));
    for (int k = 0; k < 5; k++) {
      rTwo = int(random(inputPoems.size()));
      if (r != rTwo) {
        break;
      }
    }
    //println(inputPoems);
  } else if (key >= 65 && key <= 90 || key >= 97 && key <= 122) {
    typing = typing + key;
  } else if (key == BACKSPACE) {
    typing = typing.substring(0, typing.length() - 1);
  }
}
