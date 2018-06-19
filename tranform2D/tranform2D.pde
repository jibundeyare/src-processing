void setup() {
    size(800, 600);
}

void draw() {
    background(255);

    // sauvegarde de l'état de la matrice
    pushMatrix();
    // translation (changement de l'état de la matrice)
    translate(width / 2, height / 2);
    ellipse(0, 0, 100, 100);
    // restauration de l'état de la matrice
    popMatrix();

    // sauvegarde de l'état de la matrice
    pushMatrix();
    // translation (changement de l'état de la matrice)
    translate(width * 3 / 4, height * 3 / 4);
    ellipse(0, 0, 100, 100);
    // restauration de l'état de la matrice
    popMatrix();

    pushMatrix();
    translate(width / 4, height / 4);
    rotate(radians(45));
    rectMode(CENTER);
    rect(0, 0, 100, 100);
    popMatrix();
}
