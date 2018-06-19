class Boid {
    PVector position = new PVector();
    PVector velocity = new PVector();
    PVector acceleration = new PVector();
    float maxForce = 0.05;
    float maxSpeed = 1.0;
    int borderLimit = 10;
    int separationRadius = 15;
    int cohesionRadius = 60;
    int alignmentRadius = 50;
    int mouseAttractionRadius = 300;
    int mouseRepulsionRadius = 300;
    int myColor = 0;

    Boid(float pX, float pY, float vX, float vY) {
        position.x = pX;
        position.y = pY;
        velocity.x = vX;
        velocity.y = vY;
    }

    void draw() {
        float theta = velocity.heading();

        if (theta >= 0) {
            myColor = round(map(theta, 0, PI, 240, 100));
        } else {
            myColor = round(map(theta, 0, -PI, 240, 100));
        }

        fill(myColor);
        stroke(myColor);

        pushMatrix();
        translate(position.x, position.y);
        rotate(theta);
        beginShape(TRIANGLES);
        vertex(-7, -5);
        vertex(8, 0);
        vertex(-7, 5);
        endShape();
        popMatrix();
    }

    void limit() {
        if (position.x < -borderLimit) {
            position.x = width + borderLimit;
        }

        if (position.x > width + borderLimit) {
            position.x = -borderLimit;
        }

        if (position.y < -borderLimit) {
            position.y = height + borderLimit;
        }

        if (position.y > height + borderLimit) {
            position.y = -borderLimit;
        }
    }

    void addForce(PVector force) {
        acceleration.add(force);
    }

    void resetAcceleration() {
        acceleration = new PVector();
    }

    void flock(ArrayList<Boid> boids) {
        PVector force;
        float distance = 0;

        distance = dist(mouseX, mouseY, this.position.x, this.position.y);

        if (mousePressed && mouseButton == LEFT && distance <= mouseAttractionRadius) {
            force = mouseAttraction();
            force.mult(10);
            addForce(force);
        }

        if (mousePressed && mouseButton == RIGHT && distance <= mouseRepulsionRadius) {
            force = mouseRepulsion();
            force.mult(10);
            addForce(force);
        }

        force = cohesion(boids);
        force.mult(1);
        addForce(force);

        force = separation(boids);
        force.mult(3);
        addForce(force);

        force = alignment(boids);
        force.mult(1);
        addForce(force);
    }

    PVector mouseAttraction() {
        PVector force = new PVector();

        force = seek(new PVector(mouseX, mouseY));

        return force;
    }

    PVector mouseRepulsion() {
        PVector force = new PVector();

        force = leave(new PVector(mouseX, mouseY));

        return force;
    }

    PVector leave(PVector target) {
        PVector force;
        force = seek(target);
        force.x = -force.x;
        force.y = -force.y;

        return force;
    }

    PVector seek(PVector target) {
        PVector desired = PVector.sub(target, position);
        desired.normalize();
        desired.mult(maxSpeed);

        PVector force = PVector.sub(desired, velocity);
        force.limit(maxForce);

        return force;
    }

    PVector getCenter(ArrayList<Boid> boids, int minRadius, int maxRadius) {
        PVector center = new PVector();
        int count = 0;
        float distance = 0;

        for (int i = 0; i < boids.size(); i++) {
            b = boids.get(i);
            distance = dist(b.position.x, b.position.y, this.position.x, this.position.y);

            if (distance > minRadius && distance < maxRadius) {
                center.x = center.x + b.position.x;
                center.y = center.y + b.position.y;
                count++;
            }
        }

        if (count > 0) {
            center.x = center.x / count;
            center.y = center.y / count;

            return center;
        }

        return null;
    }

    PVector cohesion(ArrayList<Boid> boids) {
        PVector center = getCenter(boids, separationRadius, cohesionRadius);

        if (center != null) {
            return seek(center);
        }

        return new PVector();
    }

    PVector separation(ArrayList<Boid> boids) {
        PVector center = getCenter(boids, 0, separationRadius);

        if (center != null) {
            return leave(center);
        }

        return new PVector();
    }

    PVector alignment(ArrayList<Boid> boids) {
        PVector direction = new PVector();
        PVector force = new PVector();
        int count = 0;
        float distance;

        for (int i = 0; i < boids.size(); i++) {
            b = boids.get(i);
            distance = dist(b.position.x, b.position.y, this.position.x, this.position.y);

            if (distance > separationRadius && distance < alignmentRadius) {
                direction.x = direction.x + b.velocity.x;
                direction.y = direction.y + b.velocity.y;
                count++;
            }
        }

        if (count > 0) {
            direction.x = direction.x / count;
            direction.y = direction.y / count;

            force = PVector.sub(direction, velocity);

            return direction;
        }

        return force;
    }

    void update() {
        velocity.add(acceleration);
        velocity.limit(maxSpeed);

        position.add(velocity);
        limit();
        resetAcceleration();
    }
}
