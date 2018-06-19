class Boid {
    PVector position = new PVector();
    PVector velocity = new PVector();
    PVector acceleration = new PVector();
    float maxForce = 5.0;
    float maxSpeed = 1.0;

    Boid(int pX, int pY, int vX, int vY) {
        position.x = pX;
        position.y = pY;
        velocity.x = vX;
        velocity.y = vY;
    }

    void draw() {
        ellipse(position.x, position.y, 5, 5);

        float theta = velocity.heading();
        pushMatrix();
        translate(position.x, position.y);
        rotate(theta);
        beginShape(TRIANGLES);
        vertex(0, -5);
        vertex(15, 0);
        vertex(0, 5);
        endShape();
        popMatrix();
    }

    PVector seek(PVector target) {
        PVector desired = target.sub(position);
        desired.normalize();
        desired.mult(maxForce);

        PVector steering = desired.sub(velocity);
        steering.normalize();
        steering.mult(maxSpeed);

        return steering;
    }

    void limit() {
        if (position.x < 0) {
            position.x = width;
        }

        if (position.x > width) {
            position.x = 0;
        }

        if (position.y < 0) {
            position.y = height;
        }

        if (position.y > height) {
            position.y = 0;
        }
    }

    void addForce(PVector force) {
        acceleration.add(force);
    }

    void resetAcceleration() {
        acceleration = new PVector();
    }

    void update() {
        if (mousePressed) {
            PVector force = seek(new PVector(mouseX, mouseY));
            addForce(force);
        }

        velocity.add(acceleration);
        position.add(velocity);
        limit();
        resetAcceleration();
    }
}
