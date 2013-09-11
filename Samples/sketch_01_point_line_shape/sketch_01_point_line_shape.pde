

void setup()
{
  // set the size of the window
  size( 800, 600 );
  // tell Processing to make our lines look nicer
  smooth();
}

void draw()
{
  // fill the screen with a color
  background( 255 );
  // draw a point at x, y
  point( 50, 50 );
  // draw a line between x1, y1 and x2, y2
  line( 100, 50, 150, 50 );
  // draw a rectangle at x, y with w, h
  rect( 200, 50, 50, 50 );
  // draw a circular ellipse at x, y with diameters
  ellipse( 300, 50, 50, 50 );
  // draw a custom polygonal shape
  beginShape();
  vertex( 400, 50 );
  vertex( 450, 50 );
  vertex( 450, 200 );
  vertex( 400, 100 );
  endShape();
  // draw a custom smooth shape
  beginShape();
  curveVertex( 500, 50 );
  curveVertex( 500, 50 );
  curveVertex( 550, 50 );
  curveVertex( 550, 200 );
  curveVertex( 500, 100 );
  curveVertex( 500, 100 );
  endShape();
}
