void setup() {
    size(800, 600);
}

void draw() {
    background(255);

    println("mouseX: " + mouseX);
    println("mouseY: " + mouseY);

    fill(0, 0, 255);
    stroke(127);
    rect(width - 200, height - 200, 200, 200);

    int x1 = width - 200;
    int y1 = height - 200;
    int x2 = x1 + 200;
    int y2 = y1 + 200;

    if (mousePressed
        && mouseX >= x1 && mouseX <= x2
        && mouseY >= y1 && mouseY <= y2
    ) {
        fill(255, 0, 0);
        stroke(127);
        rect(100, 100, 200, 200);
    }
}
