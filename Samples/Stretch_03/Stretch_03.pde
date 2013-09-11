
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
  float max_dist = dist( 0, 0, width / 2, height / 2 );
  float min_dist = 0;
  float tension = map( distance, min_dist, max_dist, 1, 20 );
  // set the width of the line based on tension
  strokeWeight( 40 / tension );

  float r = map( distance, min_dist, max_dist / 2, 0, 255 );
  stroke( r, 0, 0 );
  // draw a line from the center of the screen to the mouse
  line( width / 2, height / 2, mouseX, mouseY );
}
