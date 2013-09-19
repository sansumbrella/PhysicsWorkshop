void setup()
{
  // set the size of the window
  size( 800, 600 );
  // tell Processing to make our lines look nicer
  smooth();
}

void draw()
{
  // start with a white canvas
  background( 255 );
  strokeWeight( 8 );
  // draw a line from x, y to the mouse
  line( width / 2, height / 2, mouseX, mouseY );
}
