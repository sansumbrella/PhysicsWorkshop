// The map function lets you convert one thing into another
// Go from one set of units to another

void setup()
{
  size( 800, 600 );
  smooth();
}

void draw()
{
  background( 0 );
  noStroke();

  // convert the mouse x position from screen units (0-width)
  // to units in the color range (0-255)
  float brightness = map( mouseX, 0, width, 0, 255 );
  fill( brightness );
  ellipse( width / 2, height / 2, 256, 256 );
}

