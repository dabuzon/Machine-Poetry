void settings() {
    fullScreen();
}

// INITIALIZE
void setup() {
    frameRate(0.15);
    font = createFont("Medium.otf", width/50);
    textFont(font);
}

// CODE THAT RUNS FOREVER
void draw() {
    background(0);
    textAlign(CENTER);
    fill(#28FE14);
    int index = int(random(phrases.length));
    for (int i = 0; i < phrases.length; i++) {
        text(phrases[index], width/2, height/2);
    }
  }
