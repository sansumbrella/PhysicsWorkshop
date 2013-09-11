

void setup()
{
  size( 800, 600 );
  smooth();
}

void draw()
{
  background( 0 );
  noStroke();
  
  // get the mouse position
  float x = mouseX;
  float y = height * 0.2;
  fill( 255, 0, 0 );
  ellipse( x, y, 24, 24 );
  
  // map the mouse position to the left half of the screen
  x = map( mouseX, 0, width, 0, width * 0.5 );
  y = height * 0.4;
  fill( 0, 255, 0 );
  ellipse( x, y, 24, 24 );
  
  // map the mouse position backwards across the screen
  x = map( mouseX, 0, width, width, 0 );
  y = height * 0.6;
  fill( 0, 0, 255 );
  ellipse( x, y, 24, 24 );  
}
