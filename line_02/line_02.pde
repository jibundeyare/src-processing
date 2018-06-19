float x1, x2, y;

void setup() {
  size(800, 600);

  x1 = random(0, width);
  x2 = random(0, width);
  y = random(0, height);

  strokeWeight(3);
}

void draw() {
  background(255);

  myLine(x1, x2, y);
}

void myLine(float x1, float x2, float y) {
  line(x1, y, x2, y);
}
