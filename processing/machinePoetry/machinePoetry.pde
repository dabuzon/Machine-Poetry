
void settings() {
    fullScreen(P3D);
}

// INITIALIZE
void setup() {
    canvas = createGraphics(displayWidth, displayHeight, P3D);
    font = createFont("Medium", 32);
    textFont(font);
}

// CODE THAT RUNS FOREVER
void draw() {
    canvas.beginDraw();
    canvas.background(0);
    text("hello", mouseX, mouseY);
    canvas.endDraw();

}
