float x1 = 50;
float y1 = 50;
float x2 = 100;
float y2 = 100;
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
  x2 = width - 50;
  y2 = height - 50;
}

void draw()
{
  // fill the screen with a color
  background( bg_color );
  stroke( line_color );
  // draw a line between x1, y1 and x2, y2
  line( x1, y1, x2, y2 );
}
