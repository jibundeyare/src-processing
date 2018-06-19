ArrayList<Boid> boids;
Boid b;

void setup() {
    size(800, 600);

    boids = new ArrayList<Boid>();

    for (int i = 0; i < 250; i++) {
        b = new Boid(random(0, width), random(0, height), random(-2, 2), random(-2, 2));

        boids.add(b);
    }
}

void draw() {
    background(255);

    for (int i = 0; i < boids.size(); i++) {
        b = boids.get(i);
        b.flock(boids);
    }

    for (int i = 0; i < boids.size(); i++) {
        b = boids.get(i);
        b.update();
        b.draw();
    }
}
