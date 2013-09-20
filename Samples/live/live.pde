float ax = 300;
float ay = 150;

void setup()
{
  // set the size of the window
  size( 800, 800 );
  // tell Processing to make our lines look nicer
  smooth();
}

void draw()
{
  // fill the screen with a color
  background( 0 );
  // draw a custom polygonal shape
  beginShape();
  vertex( ax, ay );
  vertex( 600, 350 );
  vertex( 600, 600 );
  vertex( 200, 350 );
  vertex( ax, ay );
  endShape();
  
  ax = ax + 1;
}
