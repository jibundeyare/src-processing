void setup() {
    size(900, 900);
}

void draw() {
    background(105, 101, 191);

    int initialOffset = 200;
    int offsetStep = 50;
    // @warning `count` doit toujours être impair
    int count = 5;
    int median = ceil(count / 2.0);
    int xOffset, yOffset;
    int x, y;

    yOffset = initialOffset;

    for (int j = 0; j < count; j++) {
        xOffset = initialOffset;

        for (int i = 0; i < count; i++) {
            println("i: " + i);
            println("xOffset: " + xOffset);

            x = i * xOffset;
            y = j * yOffset;

            noStroke();
            fill(239, 190, 153);
            ellipse(x, y, 30, 30);

            if (i + 1 < median) {
                xOffset = xOffset - offsetStep;
            } else if (i + 1 > median) {
                xOffset = xOffset + offsetStep;
            }
        }

        if (j + 1 < median) {
            yOffset = yOffset - offsetStep;
        } else if (j + 1 > median) {
            yOffset = yOffset + offsetStep;
        }

        break;
    }

    exit();
}
