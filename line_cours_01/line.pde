float x1, x2, y;

void setup() {
    size(800, 600);

    setRandomPosition();
    strokeWeight(3);
}

void draw() {
    background(255);
    myLine(x1, x2, y);
    noLoop();
}

void mouseClicked() {
    setRandomPosition();
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
void myLine(float x1, float x2, float y) {
    int step = 10;
    int limit = 10;
    float prevX = x1;
    float prevY = y;

    for (float x = x1 + step; x < x2; x = x + step) {
        y += random(-limit, limit);
        line(prevX, prevY, x, y);
        prevX = x;
        prevY = y;
    }
}
