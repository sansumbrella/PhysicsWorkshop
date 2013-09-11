
void setup()
{
  size( 800, 600 );
}

void draw()
{
  // start with a white canvas
  background( 255 );
  // draw a line from the center of the screen to the mouse
  line( width / 2, height / 2, mouseX, mouseY );
}
