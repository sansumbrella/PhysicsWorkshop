float x;
float y;
color bg_color;
color line_color;

void setup()
{
  // set the size of the window
  size( 800, 600 );
  // tell Processing to make our lines look nicer
  smooth();
  // tell Processing to use an artist-friendlier color mode
  colorMode( HSB, 1.0 );
  // assign useful values to our variables
  line_color = color( 0.0, 1.0, 1.0 );
  bg_color = color( 0.0, 0.0, 1.0 );
  x = width / 2;
  y = height / 2;
}

void draw()
{
  // start with a white canvas
  background( bg_color );
  // draw a line from x, y to the mouse
  stroke( line_color );
  line( x, y, mouseX, mouseY );
}
