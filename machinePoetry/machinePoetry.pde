void settings() {
  fullScreen();
}

// INITIALIZE
void setup() {
  reg = createFont("book.ttf", width/35);
  italic = createFont("italic.ttf", width/35);
  standAlones = loadStrings("standAlones.txt");
  inserts = loadStrings("inserts.txt");
  noCursor();

  textFont(reg);

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
    text("If you enter a word, I will write a poem.", width/250, height/2.85, width, height/2);
    textFont(italic);
    text("Please enter a single word below", width/2, height/2);
    text(typing + "_", width/2, height/1.5);
  } else if (pageIndex == 2) {
    textFont(reg);
    // TIME STARTS
    int ms = millis() - start;
    int sec = ms/1000;

    if (sec < 3) {
      if (noMatch == false) {
        text(interject[rInter], width/2, height/2);
      } else if (noMatch) {
        text("I do not understand the word " + "\"" + saved.toLowerCase() +  ".\"", width/2, height/2);
      }
    } else if (sec >= 3 && sec < 6) {
      if (noMatch == false) {
        text("I will write a poem about " + "\"" + saved.toLowerCase() + ".\"", width/2, height/2);
      } else if (noMatch) {
        text("I will write a poem anyway.", width/2, height/2);
      }
    } else if (sec >= 6 && sec < 9) {
      text("", width/2, height/4);
    } else if (sec >= 9 && sec < 18) {
      textFont(italic);
      text(inputPoems.get(r), width/2, height/2.85);
      text(inputMiddle.get(rIn), width/2, height/2);
      text(inputPoems.get(rTwo), width/2, height/1.5325);
    } else if (sec >= 18 && sec < 23) {
      textFont(reg);
      text("And with that, it is poetry.", width/2, height/2);
    } else if (sec >= 23) {
      pageIndex--;
      inputPoems.clear();
      inputMiddle.clear();
      noMatch = false;
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
        if (saved.equals(word)) {
          inputPoems.append(line);
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
          // is it removing the commas that make it an array? feels like its recreating a string
          iWord = iWord.replaceAll("[^a-zA-Z0-9]","");
          iWord = iWord.toUpperCase();
          if (saved.equals(iWord)) {
            inputMiddle.append(iLine);
            break;
          }
        }
      }

      if (inputMiddle.size() < 1) {
        noMatch = true;
        inputMiddle.append(inserts);
      }
    } else if (inputPoems.size() >= 1) {
      inputMiddle.append(inserts);
    }

    rInter = int(random(interject.length));
    rIn = int(random(inputMiddle.size()));
    r = int(random(inputPoems.size()));
    for (int k = 0; k < 5; k++) {
      rTwo = int(random(inputPoems.size()));
      if (r != rTwo) {
        break;
      }
    }
  } else if (key >= 65 && key <= 90 || key >= 97 && key <= 122 && pageIndex == 1) {
    typing += key;
  } else if (key == BACKSPACE && typing.length() >= 1) {
    typing = typing.substring(0, typing.length() - 1);
  }
}
