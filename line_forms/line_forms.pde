import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

int step, limit, yStep;
float x1, y1, x2, y2;

void setup() {
    size(800, 600, P3D);

    cam = new PeasyCam(this, 100);

    step = 10;
    limit = 10;
    yStep = 10;
}

void draw() {
    background(255);

    for (int i = 0; i < 200; i++) {
        x1 = 0;
        y1 = yStep * i;
        x2 = width - 1;
        y2 = yStep * i;
        myLine(x1, y1, x2, y2, step, limit);
    }

    // déactivé pour que PeasyCam fonctionne correctement
    // noLoop();
}

void mouseMoved() {
    step = round(map(mouseX, 0, width - 1, 1, 50));
    limit = round(map(mouseY, 0, height, 0, 20));
    redraw();
}

void setRandomPosition() {
    // point de départ
    x1 = random(0, width - 1);
    y1 = random(0, height - 1);

    // point d'arrivée
    x2 = random(0, width - 1);
    y2 = random(0, height - 1);

    // println("x1, y1, x2, y2");
    // println(x1);
    // println(y1);
    // println(x2);
    // println(y2);
}

void myLine(float x1, float y1, float x2, float y2, int step, int limit) {
    PVector v = new PVector(x2 - x1, y2 - y1);
    pushMatrix();
    translate(x1, y1);
    rotate(v.heading());
    float y;
    float prevX = 0;
    float prevY = 0;

    for (float x = step; x < v.mag(); x = x + step) {
        y = random(-limit, limit);
        line(prevX, prevY, x, y);
        prevX = x;
        prevY = y;
    }

    line(prevX, prevY, v.mag(), 0);
    popMatrix();
}