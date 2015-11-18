boolean isOpening = true; // if the mouth is opening
float mouthAngle = 0; // angle of the mouth when it starts
float mouthChange = TWO_PI/180; //what angle the mouth extends to
int x; // tracks horizontal position of pacman
int s; // speed of x value
int y; // tracks vertical position of pacman
int b; // speed of y value
int d = 1; // direction : 1 = right, 2 = left, 3 = up, 4 = down

void setup() {
  size(1000, 600);
  smooth();
  x = 25; // place pacman at bottom left
  y= 125; // place pacman on line
}

void draw() {
  noStroke();
  fill(255, 255, 0);
  if (isOpening == true) mouthAngle += mouthChange; // change the mouth if it reaches certain angle
  else mouthAngle -= mouthChange;

  if (mouthAngle >= TWO_PI/10 || mouthAngle <= 0) isOpening = !isOpening;
  //where it says two.pi and then 10, change the 10 to make the mouth open faster
  background(0);

  // change the way the mouth faces
  if ( d == 4) {
    arc(x, y, 30, 30, PI/2+mouthAngle, PI/2+TWO_PI-mouthAngle); // DOWN
  } else if ( d == 3) {
    arc(x, y, 30, 30, PI*3/2+mouthAngle, PI*3/2+TWO_PI-mouthAngle); //UP
  } else if ( d == 2) {
    arc(x, y, 30, 30, PI+mouthAngle, PI+TWO_PI-mouthAngle); // LEFT
  } else if ( d == 1) {
    arc(x, y, 30, 30, 0+mouthAngle, TWO_PI-mouthAngle); // RIGHT
  }

  // draw the map
  noFill();
  strokeWeight(3);
  stroke(#0518E3);
  beginShape();
  vertex(300, 200);
  vertex(700, 200);
  vertex(700, 350);
  vertex(300, 350);
  vertex(300, 200);
  endShape();

  beginShape();
  strokeWeight(3);
  stroke(#0518E3);
  vertex(100, 50);
  vertex(100, 150);
  endShape();

  // draw the lines
  //stroke(200);
  //fill(255);
  //beginShape(LINES);
  //vertex(0, 300);
  //vertex(900, 300);
  //vertex(0, 150);
  //vertex(900, 150);
  //endShape();

  x = x +s; // speed of pacman x
  y = y +b; // speed of pacman y

  if ( x > 1000) { // set x position to left side of screen
    x = -25;
  } else if ( x < -25) { // set x position to right side of screen
    x = 1000;
  }
  if ( y < 0) { // set y position to top of screen
    y = 600;
  }
  if ( y > 600) { // set y position to bottom of screen
    y = 0;
  }
}


void keyPressed() {
  // make pacman move left and right up and down
  if (key == CODED) {
    if (keyCode == LEFT) {
      s = - 4; // speed
      b = 0; 
      d = 2;
    } 
    if (keyCode == RIGHT) {
      s = 4; 
      b = 0;
      d = 1;
    }
    if (keyCode == UP) {
      b = - 4; // speed
      s = 0;
      d = 3;
    }
    if (keyCode == DOWN) {
      b = 4;
      s = 0;
      d = 4;
    }
  }
  if (keyCode == ' ') {
    b = 0;
    s = 0;
  }
}