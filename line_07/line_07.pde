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
  x1 = random(0, width);
  x2 = random(0, width);
  y = random(0, height);
}

void myLine(float x1, float x2, float y) {
  float noiseY = random(10);
  float offset = 10;
  int limit = 10;
  int step = 10;
  float prevX = x1;
  float prevY = y + noise(noiseY) * offset;

  for (float x = x1 + step; x < x2; x += step) {
    offset = random(-limit, limit);
    y += noise(noiseY) * offset;
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
    noiseY += 0.1;
  }
}
