// Name : Ryan Gajer

// Purpose : To make Pacman for ISP and to demonstrate my knowledge of this code

boolean isOpening = true; // if the mouth is opening, do what it says in the code below
float mouthAngle = 0; // angle of the mouth when it starts
float mouthChange = TWO_PI/180; //what angle the mouth extends to
int pacX = 30; // x size of pacman
int pacY = 30; // y size of pacman
float x; // tracks horizontal position of pacman
int s; // speed of x value
float y; // tracks vertical position of pacman
int b; // speed of y value
int d = 1; // direction : 1 = right, 2 = left, 3 = up, 4 = down
final int D_RIGHT = 1; // sets the final direction to be 1, which is going right
final int D_LEFT = 2; // sets the final direction to be 2, which is going left
final int D_UP = 3; // sets the final direction to be 3, which is going up
final int D_DOWN = 4; // sets the final direction to be 4, which is going down
PImage red_ghost; // red ghost
PImage aqua_ghost; // aqua ghost
PImage orange_ghost; // orange ghost
PImage pink_ghost; // pink ghost
float[] foodx = new float[5]; // food X
float[] foody = new float[5]; // food Y

void setup() {
  frameRate(60);
  size(1000, 600);
  smooth();

  // set the position of all the pellets
  foodx[0] = 75;
  foodx[1] = 150;
  foodx[2] = 225;
  foodx[3] = 300;
  foodx[4] = 375;

  foody[0] = 275;
  foody[1] = 275;
  foody[2] = 275;
  foody[3] = 275;
  foody[4] = 275;


  x = 150; // place pacman at bottom left
  y = 275; // place pacman on line
  red_ghost = loadImage("ghost_red.png"); // draw the red ghost
  aqua_ghost = loadImage("ghost_aqua.png"); // draw the aqua ghost
  orange_ghost = loadImage("ghost_orange.png"); // draw the orange ghost 
  pink_ghost = loadImage("ghost_pink.png"); // draw the pink ghost
}
void draw() {
  noStroke();
  fill(255, 255, 0);
  if (isOpening == true) mouthAngle += mouthChange; // change the mouth if it reaches certain angle
  else mouthAngle -= mouthChange; 

  if (mouthAngle >= TWO_PI/15 || mouthAngle <= 0) isOpening = !isOpening;
  //where it says two.pi and then 10, change the 10 to make the mouth open faster
  background(0);

  // change the way the mouth faces
  if ( d == D_DOWN) {
    arc(x, y, pacX, pacY, PI/2+mouthAngle, PI/2+TWO_PI-mouthAngle); // DOWN
  } else if ( d == D_UP) {
    arc(x, y, pacX, pacY, PI*3/2+mouthAngle, PI*3/2+TWO_PI-mouthAngle); //UP
  } else if ( d == D_LEFT) {
    arc(x, y, pacX, pacY, PI+mouthAngle, PI+TWO_PI-mouthAngle); // LEFT
  } else if ( d == D_RIGHT) {
    arc(x, y, pacX, pacY, 0+mouthAngle, TWO_PI-mouthAngle); // RIGHT
  }

  // draw the map


  // middle rect
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


  // top left rect
  beginShape();
  vertex(333, 150);
  vertex(45, 150);
  vertex(45, 45);
  vertex(333, 45);
  vertex(333, 150);
  endShape();

  // top right rect
  beginShape();
  vertex(667, 150);
  vertex(955, 150);
  vertex(955, 45);
  vertex(667, 45);
  vertex(667, 150);
  endShape();

  // bottom left rect
  beginShape();
  vertex(333, 400);
  vertex(45, 400);
  vertex(45, 555);
  vertex(333, 555);
  vertex(333, 400);
  endShape();

  // bottom right rect
  beginShape();
  vertex(667, 400);
  vertex(955, 400);
  vertex(955, 555);
  vertex(667, 555);
  vertex(667, 400);
  endShape();

  //draw the border
  //beginShape();
  //vertex(5, 5);
  //vertex(995, 5);
  //vertex(995, 595);
  //vertex(5, 595);
  //vertex(5, 5);
  //endShape();

  // draw the ghosts

  // red
  imageMode(CENTER);
  image(red_ghost, 400, 185, 35, 35);

  // aqua
  imageMode(CENTER);
  image(aqua_ghost, 450, 185, 43, 43);

  // orange 
  imageMode(CENTER);
  image(orange_ghost, 500, 185, 35, 35);

  // pink
  imageMode(CENTER);
  image(pink_ghost, 550, 185, 43, 43);

  // speed 

  x = x + s; // speed x 
  y = y + b; // speed y

  // if pacman leaves the areas on map, return back into map

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

  // food for pacman
  int counter = 0;
  //                    5
  while (counter < foodx.length) {
    println("hey, i'm in the loop, it's iteration number: " + counter);

    strokeWeight(5);
    stroke(255); // white
    fill(255);
    ellipse( foodx[counter], foody[counter], 10, 10); // draw the pellet on the right of pacman
    println(foodx[0]);

    // if pacman hits food, get rid of it
    float e = (foody[counter]-y)*(foody[counter]-y);
    float f = (foodx[counter]-x)*(foodx[counter]-x);
    float g = sqrt(e+f);
    if (g<15) {
      foodx[counter]=-100;
    }    
    
    // update the loop counter
    counter = counter + 1;
  }

  // hit detection 

  text("x is: " + x, 100, 75);
  text("y is: " + y, 100, 95);
  text("direction is; " + d, 100, 115);

  // middle rectangle

  // stop the pacman if it hits edges
  if (x > 285 && x < 720 && y < 370 && y > 185 && d == D_RIGHT) { //left edge
    x = x - s; // pushes back out of boundary
    y = y - b; // pushes back out of boundary
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println(" left edge moving right");
    println("direction is: " + d);
  } else if ( x < 720 && x > 285 && y < 370 && y > 185 && d == D_LEFT) { // right edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println(" right edge moving left ");
    println("direction is: " + d);
  } else if (x > 285 && y < 370 && y > 185 && x < 720 && d == D_DOWN) { // top edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println(" top edge moving down");
    println("direction is: " + d);
  } else if ( x > 285 && y < 370 && x < 720 && y > 185 && d == D_UP ) { // bottom edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println(" bottom edge moving up ");
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  }


  // top left rectangle

  if ( x < 353 && x > 30 &&  y < 170 && y > 30 && d == D_RIGHT) { // left edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else  if ( x < 353 && x > 30 && y < 170 && y > 30 && d == D_LEFT) { // right edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if (x < 353 && x > 30 && y > 30 && y < 170 && d == D_DOWN) { // top edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if ( x < 353 && x > 30 && y < 170 && y > 30 && d == D_UP) { // bottom edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  }

  // top right rectangle 
  if ( x > 652 && x < 975 && y < 170 && y > 30 && d == D_RIGHT) { // left edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if ( x > 652 && x < 975 && y < 170 && y > 30 && d == D_LEFT) { // right edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if ( x > 652 && x < 975 && y < 170 && y > 30 && d == D_DOWN) { // top edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if ( x > 652 && x < 975 && y < 170 && y > 30 && d == D_UP) { // bottom edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  }

  // bottom left rectangle
  if ( x < 353 && x > 30 && y > 385 && y < 535 && d == D_RIGHT) { // left edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if ( x < 353 && x > 30 && y > 385 && y < 535 && d == D_LEFT) { // right edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if ( x < 353 && x > 30 && y > 385 && y < 535 && d == D_DOWN) { // top edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else if ( x < 353 && x > 30 && y > 385 && y < 575 && d == D_UP) { // bottom edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  }

  // bottom right rectangle
  if ( x > 652 && x < 975 && y > 385 && y < 575 && d == D_RIGHT) { // left edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else  if ( x > 652 && x < 975 && y > 385 && y < 570 && d == D_LEFT) { // right edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else  if ( x > 652 && x < 975 && y > 385 && y < 570 && d == D_DOWN) { // top edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
  } else  if ( x > 652 && x < 975 && y > 385 && y < 570 && d == D_UP) { // bottom edge
    x = x - s;
    y = y - b;
    s = 0;
    b = 0;
    println("x is: " + x);
    println("y is: " + y);
    println("direction is: " + d);
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