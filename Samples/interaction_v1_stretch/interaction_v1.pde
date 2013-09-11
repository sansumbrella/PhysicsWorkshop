
void setup()
{
  size( 800, 600 );
}

void draw()
{
  background( 255 );
  // how far is the cursor from the center of the screen?
  float distance = dist( width / 2, height / 2, mouseX, mouseY );
  // convert that distance to an arbitrary tension value
  float tension = map( distance, 0, 500, 1, 20 );
  // set the width of the line based on tension
  strokeWeight( 80 / tension );
  // draw a line from the center of the screen to the mouse
  line( width / 2, height / 2, mouseX, mouseY );
}
