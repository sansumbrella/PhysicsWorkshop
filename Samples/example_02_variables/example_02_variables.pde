float ax = 50;
float ay = 50;
float bx = 100;
float by = 100;
color bg_color;
color line_color;

void setup()
{
  // set the size of the window
  size( 800, 600 );
  // tell Processing to make our lines look nicer
  smooth();
  // specify colors with hue, saturation, and brightness
  colorMode( HSB, 1.0 );
  // assign useful values to our variables
  line_color = color( 0.0, 1.0, 1.0 );
  bg_color = color( 0.0, 0.0, 1.0 );
  bx = width - 50;
  by = height - 50;
}

void draw()
{
  // fill the screen with a color
  background( bg_color );
  stroke( line_color );
  // draw a line between x1, y1 and x2, y2
  line( ax, ay, bx, by );
  // animate the line by changing the variables
  ax = ax + 1;
  bx = bx - 1;
}
