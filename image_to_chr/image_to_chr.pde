// inspiration :
// sketch P_4_3_1_01
// [Generative Design](http://www.generative-gestaltung.de/2/)
// [p5.js Web Editor | P_4_3_2_01](http://alpha.editor.p5js.org/generative-design/sketches/P_4_3_2_01)

PImage myImage;
int imageSize = 0;
PFont myFont;
int maxFontSize = 14;
int minFontSize = 8;
int xOffset = 8;
int yOffset = 8;

void setup() {
    size(800, 800);

    String[] asFontList = PFont.list();
    saveStrings("font_list.txt", asFontList);

    myImage = loadImage("laDefense.png");
    imageSize = myImage.width * myImage.height;

    println("imageSize: " + imageSize);

    myFont = createFont("Times New Roman", maxFontSize);
    textFont(myFont);
}

void draw() {
    background(255);

    // image(myImage, 0, 0);

    int myColor;
    String letter;

    myImage.loadPixels();

    int x, y;
    float fontSize;
    float grayLevel;

    for (int i = 0; i < imageSize; i++) {
        myColor = myImage.pixels[i];
        letter = Character.toString(myText.charAt(i));

        x = (i % myImage.width) * xOffset;
        y = (i / myImage.width) * yOffset;

        fill(myColor);
        grayLevel = brightness(myColor);
        fontSize = map(grayLevel, 0, 255, 12, 6);
        textSize(fontSize);
        text(letter, x, y);
    }
}
