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
float[] foodx = new float[100]; // food X
float[] foody = new float[100]; // food Y
float gx1; // first ghosts x position  = aqua
float gy1; // first ghosts y position  = aqua
float gxs1 = 3; // x speed of first ghost  = aqua
float gys1; // y speed of first ghost = aqua
float gx2; // seconds ghosts x position = red
float gy2; // seconds ghosts y position = red
float gxs2 = 3; // second ghosts x speed = red
float gys2; // second ghosts y speed = red
float gx3; // third ghosts x position = pink
float gy3; // third ghosts y position = pink
float gxs3 = 3; // third ghosts x speed = pink
float gys3; // third ghosts y speed = pink
float gx4; // fourth ghosts x position = yellow
float gy4; // fourth ghosts y position = yellow
float gxs4 = 3; // fourth ghosts x speed = yellow
float gys4; // fourth ghosts y speed = yellow
int score = 0;
int highscore; 
void setup() {
  frameRate(60);
  size(1000, 600);
  smooth();
  //gx1 = gx1 + random(0, 3);

  // set the position of all the pellets

  // middle left 
  foodx[0] = 25;
  foody[0] = 275;

  foodx[1] = 75;
  foody[1] = 275;

  foodx[2] = 125;
  foody[2] = 275;

  foodx[3] = 175;
  foody[3] = 275;

  foodx[4] = 225;
  foody[4] = 275;

  foodx[5] = 275;
  foody[5] = 275;

  foodx[6] = 25; 
  foody[6] = 325;

  foodx[7] = 75;
  foody[7] = 325;

  foodx[8] = 125;
  foody[8] = 325;

  foodx[9] = 175;
  foody[9] = 325;

  foodx[10] = 225;
  foody[10] = 325;

  foodx[11] = 275;
  foody[11] = 325;

  foodx[12] = 25;
  foody[12] = 225;

  foodx[13] = 75;
  foody[13] = 225;

  foodx[14] = 125;
  foody[14] = 225;

  foodx[15] = 175;
  foody[15] = 225;

  foodx[16] = 225;
  foody[16] = 225;

  foodx[17] = 275;
  foody[17] = 225;

  // row above middle rectangle

  foodx[18] = 25;
  foody[18] = 175;

  foodx[19] = 75;
  foody[19] = 175;

  foodx[20] = 125;
  foody[20] = 175;

  foodx[21] = 175;
  foody[21] = 175;

  foodx[22] = 225;
  foody[22] = 175;

  foodx[23] = 275;
  foody[23] = 175;

  foodx[24] = 325;
  foody[24] = 175;

  foodx[25] = 375;
  foody[25] = 175;

  foodx[26] = 425;
  foody[26] = 175;

  foodx[27] = 475;
  foody[27] = 175;

  foodx[28] = 525;
  foody[28] = 175;

  foodx[29] = 575;
  foody[29] = 175;

  foodx[30] = 625;
  foody[30] = 175;

  foodx[31] = 675;
  foody[31] = 175;

  foodx[32] = 725;
  foody[32] = 175;

  foodx[33] = 775;
  foody[33] = 175;

  foodx[34] = 825;
  foody[34] = 175;

  foodx[35] = 875;
  foody[35] = 175;

  foodx[36] = 925;
  foody[36] = 175;

  foodx[37] = 975;
  foody[37] = 175;

  // middle right rectangle

  foodx[39] = 725;
  foody[39] = 225;

  foodx[40] = 775;
  foody[40] = 225;

  foodx[41] = 825;
  foody[41] = 225;

  foodx[42] = 875;
  foody[42] = 225;

  foodx[43] = 925;
  foody[43] = 225;

  foodx[44] = 975;
  foody[44] = 225;

  foodx[45] = 725;
  foody[45] = 275;

  foodx[46] = 775;
  foody[46] = 275;

  foodx[47] = 825;
  foody[47] = 275;

  foodx[48] = 875;
  foody[48] = 275;

  foodx[49] = 925;
  foody[49] = 275;

  foodx[50] = 975;
  foody[50] = 275;

  foodx[51] = 725;
  foody[51] = 325;

  foodx[52] = 775;
  foody[52] = 325;

  foodx[53] = 825;
  foody[53] = 325;

  foodx[54] = 875;
  foody[54] = 325;

  foodx[55] = 925;
  foody[55] = 325;

  foodx[56] = 975;
  foody[56] = 325;

  // row below middle rectangle

  foodx[57] = 25;
  foody[57] = 375;

  foodx[58] = 75;
  foody[58] = 375;

  foodx[59] = 125;
  foody[59] = 375;

  foodx[60] = 175;
  foody[60] = 375;

  foodx[61] = 225;
  foody[61] = 375;

  foodx[62] = 275;
  foody[62] = 375;

  foodx[63] = 325;
  foody[63] = 375;

  foodx[64] = 375;
  foody[64] = 375;

  foodx[65] = 425;
  foody[65] = 375;

  foodx[66] = 475;
  foody[66] = 375;

  foodx[67] = 525;
  foody[67] = 375;

  foodx[68] = 575;
  foody[68] = 375;

  foodx[69] = 625;
  foody[69] = 375;

  foodx[70] = 675;
  foody[70] = 375;

  foodx[71] = 725;
  foody[71] = 375;

  foodx[72] = 775;
  foody[72] = 375;

  foodx[73] = 825;
  foody[73] = 375;

  foodx[74] = 875;
  foody[74] = 375;

  foodx[75] = 925;
  foody[75] = 375;

  foodx[76] = 975;
  foody[76] = 375;

  // load the ghosts and display pacman with coordinates x and y

  x = 500; // place pacman at bottom left
  y = 125; // place pacman on line
  gx1 = 450; // aqua ghosts x position
  gy1 = 185; // aqua ghosts y position
  gx2 = 150; // red ghosts x position 
  gy2 = 285; // red ghosts y position 
  gx3 = 550; // pink ghosts x position
  gy3 = 375; // pink ghosts y position 
  gx4 = 300; // yellow ghosts x position
  gy4  = 230; // yellow ghosts y position
  red_ghost = loadImage("ghost_red.png"); // display the red ghost
  aqua_ghost = loadImage("ghost_aqua.png"); // display the aqua ghost
  orange_ghost = loadImage("ghost_orange.png"); // display the orange ghost 
  pink_ghost = loadImage("ghost_pink.png"); // display the pink ghost
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
  image(red_ghost, gx2, gy2, 35, 35);

  // aqua
  imageMode(CENTER);
  image(aqua_ghost, gx1, gy1, 43, 43);

  // orange 
  imageMode(CENTER);
  image(orange_ghost, gx4, gy4, 35, 35);

  // pink
  imageMode(CENTER);
  image(pink_ghost, gx3, gy3, 43, 43);

  // speed of pacman

  x = x + s; // speed x 
  y = y + b; // speed y

  // spped of ghosts
  gx1 = gx1 + gxs1; // aqua
  gy1 = gy1 + gys1;

  gx2 = gx2 + gxs2; // red
  gy2 = gy2 + gys2;

  gx3 = gx3 + gxs3; // pink
  gy3 = gy3 + gys3;

  gx4 = gx4 + gxs4; // yellow
  gy4 = gy4 + gys4;

  // hit detection of first ghost (aqua)

  if ( gx1 > 1000) {
    int choice = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice < 1) {
      gxs1 = -3; // go left
      gys1 = 0;
    } else if (choice < 2) { // go down
      gys1 = 3;
      gxs1 = 0;
    } else { // go up
      gys1 = -3;
      gxs1 = 0;
    }
  }
  if ( gx1 < 10) {
    int choice1 = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice1 < 1) { // right
      gxs1 = 3;
      gys1 = 0;
    } else if ( choice1 < 2) { // go down
      gxs1 = 0;
      gys1 = 3;
    } else { // go up
      gxs1 = 0;
      gys1 = -3;
    }
  }

  // hit detection of second ghost (red)

  if ( gx2 > 1000) {
    int choice2 = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice2 < 1) {
      gxs2 = -3; // go left
      gys2 = 0;
    } else if (choice2 < 2) { // go down
      gys2 = 3;
      gxs2 = 0;
    } else { // go up
      gys2 = -3;
      gxs2 = 0;
    }
  }
  if ( gx2 < 10) {
    int choice1 = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice1 < 1) { // right
      gxs2 = 3;
      gys2 = 0;
    } else if ( choice1 < 2) { // go down
      gxs2 = 0;
      gys2 = 3;
    } else { // go up
      gxs2 = 0;
      gys2 = -3;
    }
  }

  // hit detection of second ghost (pink)

  if ( gx3> 1000) {
    int choice3 = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice3 < 1) {
      gxs3 = -3; // go left
      gys3 = 0;
    } else if (choice3 < 2) { // go down
      gys3 = 3;
      gxs3 = 0;
    } else { // go up
      gys3 = -3;
      gxs3 = 0;
    }
  }
  if ( gx3 < 10) {
    int choice3 = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice3 < 1) { // right
      gxs3 = 3;
      gys3 = 0;
    } else if ( choice3 < 2) { // go down
      gxs3 = 0;
      gys3 = 3;
    } else { // go up
      gxs3 = 0;
      gys3 = -3;
    }
  }

  // hit detection of second ghost (yellow)

  if ( gx4> 1000) {
    int choice4 = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice4 < 1) {
      gxs4 = -3; // go left
      gys4 = 0;
    } else if (choice4 < 2) { // go down
      gys4 = 3;
      gxs4 = 0;
    } else { // go up
      gys4 = -3;
      gxs4 = 0;
    }
  }
  if ( gx4 < 10) {
    int choice4 = int(random(0, 3)); // random chance in a 0-3 value
    if ( choice4 < 1) { // right
      gxs4 = 3;
      gys4 = 0;
    } else if ( choice4 < 2) { // go down
      gxs4 = 0;
      gys4 = 3;
    } else { // go up
      gxs4 = 0;
      gys4 = -3;
    }
  }
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
  // if pacman hits the ghosts, end the game
    if(dist(x,y,gx1,gy1)<=15) {
    textSize(80);
    noLoop();
    background(255);
    textAlign(CENTER);
    textSize(60);
    fill(0);
    text("Game Over!", 500, 250);
    fill(0);
    text("Click to Restart", 500, 350);
    textSize(12);
    text("highscore: " + highscore, 715, 20);
    } else  if(dist(x,y,gx2,gy2)<=15) { 
    textSize(80);
    noLoop();
    background(255);
    textAlign(CENTER);
    textSize(60);
    fill(0);
    text("Game Over!", 500, 250);
    fill(0);
    text("Click to Restart", 500, 350);
    textSize(12);
    text("highscore: " + highscore, 715, 20);
  } else  if(dist(x,y,gx3,gy3)<=15) { 
   textSize(80);
    noLoop();
    background(255);
    textAlign(CENTER);
    textSize(60);
    fill(0);
    text("Game Over!", 500, 250);
    fill(0);
    text("Click to Restart", 500, 350);
    textSize(12);
    text("highscore: " + highscore, 715, 20);
  } else  if(dist(x,y,gx4,gy4)<=15) { 
   textSize(80);
    noLoop();
    background(255);
    textAlign(CENTER);
    textSize(60);
    fill(0);
    text("Game Over!", 500, 250);
    fill(0);
    text("Click to Restart", 500, 350);
    textSize(12);
    text("highscore: " + highscore, 715, 20);
  }

  // food for pacman
  int counter = 0;
  //                    76
  while (counter < foodx.length) {
    println("hey, i'm in the loop, it's iteration number: " + counter);

    strokeWeight(5);
    stroke(255); // white
    fill(255);
    ellipse( foodx[counter], foody[counter], 5, 5); // draw the pellet on the right of pacman
    println(foodx[0]);

    // if pacman hits food, get rid of it
    float e = (foody[counter]-y)*(foody[counter]-y);
    float f = (foodx[counter]-x)*(foodx[counter]-x);
    float g = sqrt(e+f);
    if (g<15) {
      foodx[counter]=-100;
      score++;
    }    

    // update the loop counter
    counter = counter + 1;
  }

  // safezone text
  // top
  textSize(32); 
  text("SAFEZONE", 425, 100);
  fill(255);
  //bottom
  textSize(32);
  text("SAFEZONE", 425, 500);
  fill(255);
  
  // score
  textSize(30);
  text("score:" + score, 750, 95); 

  // text on screen x, y, direction
  textSize(20);
  text("x is: " + x, 100, 75);
  text("y is: " + y, 100, 95);
  text("direction is: " + d, 100, 115);

  // hit detection 

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
      s = - 3; // speed
      b = 0; 
      d = 2;
    } 
    if (keyCode == RIGHT) {
      s = 3; 
      b = 0;
      d = 1;
    }
    if (keyCode == UP) {
      b = - 3; // speed
      s = 0;
      d = 3;
    }
    if (keyCode == DOWN) {
      b = 3;
      s = 0;
      d = 4;
    }
  }
}