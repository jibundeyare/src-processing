int step, limit;
float x1, x2, y;

void setup() {
    size(800, 600);

    step = 10;
    limit = 10;
    x1 = 0;
    x2 = width - 1;
    y = 456;
}

void draw() {
    background(255);
    myLine(x1, x2, y, step, limit);
    noLoop();
}

void mouseMoved() {
    step = round(map(mouseX, 0, width - 1, 1, 50));
    limit = round(map(mouseY, 0, height, 0, 20));
    redraw();
}

void setRandomPosition() {
    // point de départ
    x1 = random(0, width - 1);
    // point d'arrivée
    x2 = random(0, width - 1);
    y = random(0, height - 1);

    // si le point de départ est plus grand que le point d'arrivée, il faut intervertir x1 et x2
    if (x1 > x2) {
        float t = x1;
        x1 = x2;
        x2 = t;
    }

    // println("x1, x2, y");
    // println(x1);
    // println(x2);
    // println(y);
}

// il faut que le point de départ soit plus petit que le point d'arrivée pour que notre algorithme fonctionne
void myLine(float x1, float x2, float y, int step, int limit) {
    float originalY = y;
    float prevX = x1;
    float prevY = y;

    for (float x = x1 + step; x < x2; x = x + step) {
        y = originalY + random(-limit, limit);
        line(prevX, prevY, x, y);
        prevX = x;
        prevY = y;
    }

    line(prevX, prevY, x2, originalY);
}
