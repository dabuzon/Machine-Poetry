void settings() {
    fullScreen();
}

// INITIALIZE
void setup() {
    frameRate(0.5);
    font = createFont("Medium.otf", width/50);
    textFont(font);
}

// CODE THAT RUNS FOREVER
void draw() {
    background(0);
    textAlign(CENTER);
    fill(#28FE14);
    int indexIndp = int(random(indp.length));
    int indexStart = int(random(start.length));
    int indexEnd = int(random(end.length));

    for (int i = 0; i < indp.length; i++) {
        text(indp[indexIndp], width/2, height/3);
    }
    for (int i = 0; i < start.length; i++) {
        text(start[indexStart], width/2, height/2);
    }
    for (int i = 0; i < end.length; i++) {
        text(end[indexEnd], width/2, height/1.5);
    }
  }
