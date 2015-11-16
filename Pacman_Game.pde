boolean isOpening = true; // if the mouth is opening
float mouthAngle = 0; // angle of the mouth
float mouthChange = TWO_PI/180; //what angle the mouth extends to
int x; // tracks horizontal position of pacman
int s; // speed of x value
int y; // tracks vertical position of pacman
int b; // speed of y value

void setup() {
  size(700, 200);
  smooth();
  x = 25; // place pacman at bottom left
  y= 125;
}

void draw() {
  noStroke();
  fill(255, 255, 0);
  if (isOpening == true) mouthAngle += mouthChange; // change the mouth if it reaches certain angle
  else mouthAngle -= mouthChange;

  if (mouthAngle >= TWO_PI/10 || mouthAngle <= 0) isOpening = !isOpening;
  //where it says two.pi and then 10, change the 10 to make the mouth open faster
  background(0);

  arc(x, y, 50, 50, 0+mouthAngle, TWO_PI-mouthAngle);

  // draw the lines
  stroke(200);
  fill(255);
  beginShape(LINES);
  vertex(0, 50);
  vertex(700, 50);
  vertex(0, 150);
  vertex(700, 150);
  endShape();

  x = x +s; // speed of pacman x
  y = y +b; // speed of pacman y

  if ( x > 700) { // loops back to -25
    x = -25;
  } else if ( x < -25) { // loops back to 700
    x = 700;
  }
  if ( y < 0) {
    y = 200;
  }
}


void keyPressed() {
  // make pacman move left and right
  if (key == CODED) {
    if (keyCode == LEFT) {
      s = - 4;
      b=  0;
    } 
    if (keyCode == RIGHT) {
      s = 4;
      b = 0;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      b = -4;
      s= 0;
    }
    if (key == CODED) {
      if (keyCode == DOWN) {
        b = 4;
        s = 0;
      }
    }
  }
}