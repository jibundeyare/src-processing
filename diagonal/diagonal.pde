int x1 = 123;
int y1 = 435;
int x2 = 556;
int y2 = 576;

void setup() {
    size(800, 600);
}

void draw() {
    background(255);

    myLine(x1, y1, x2, y2);
}

void myLine(int x1, int y1, int x2, int y2) {
    PVector v = new PVector(x2 - x1, y2 - y1);
    pushMatrix();
    translate(x1, y1);
    rotate(v.heading());
    line(0, 0, v.mag(), 0);
    popMatrix();
}
