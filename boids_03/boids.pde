Boid b;

void setup() {
    size(800, 600);

    b = new Boid(width / 2, height / 2, round(random(-2, 2)), round(random(-2, 2)));
}

void draw() {
    background(255);

    b.update();
    b.draw();
}
