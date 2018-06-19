void setup() {
    size(600, 600);
}

void draw() {
    background(255);

    int rectSize = 40;
    int angle = 20;
    int initialOffset = round(map(mouseY, 0, height, 50, 150));
    int offsetStep = round(map(mouseX, 0, width, 50, 5));
    int xOffset, yOffset;
    int x, y;

    noStroke();
    fill(0);

    yOffset = initialOffset;

    for (int j = 0; j < 12; j++) {
        y = j * yOffset;
        xOffset = initialOffset;

        for (int i = 0; i < 12; i++) {
            x = i * xOffset;

            pushMatrix();
            translate(x, y);
            rotate(radians(angle));
            rect(0, 0, rectSize, rectSize);
            popMatrix();

            xOffset = xOffset - offsetStep;
        }

        yOffset = yOffset - offsetStep;
    }
}
