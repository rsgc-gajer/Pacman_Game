boolean isOpening = true; // if the mouth is opening
float mouthAngle = 0; // angle of the mouth
float mouthChange = TWO_PI/180; //what angle the mouth extends to
int x; // tracks horizontal position of pacman

void setup() {
  size(700, 200);
  smooth();
  x = -25;
}

void draw() {
  noStroke();
  fill(255, 255, 0);
  if (isOpening == true) mouthAngle += mouthChange; // change the mouth if it reaches certain angle
  else mouthAngle -= mouthChange;

  if (mouthAngle >= TWO_PI/10 || mouthAngle <= 0) isOpening = !isOpening;
  //where it says two.pi and then 10, change the 10 to make the mouth open faster

  background(0);

  arc(x, 125, 50, 50, 0+mouthAngle, TWO_PI-mouthAngle);
           
  // draw the lines
  stroke(200);
  fill(255);
  beginShape(LINES);
  vertex(0, 50);
  vertex(700, 50);
  vertex(0, 150);
  vertex(700, 150);
  endShape();
  
  x = x +4; // speed of pacman
}