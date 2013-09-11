// Declare variables
Node node;
color slow;
color fast;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );      // set the window size
  smooth();              // smooth out the edges of our graphics
  node = new Node( width / 2, height / 2 );
  colorMode( HSB, 1.0 );
  slow = color( 0.6, 1.0, 1.0 );
  fast = color( 1.0, 1.0, 1.0 );
}

void draw()
{ // Update everything
  node.update();              // update simulation elements
  // Draw to screen
  background( 0 );            // clear out the screen with black
  // speed is how far we traveled
  float speed = dist( node.x, node.y, node.px, node.py );
  float normalized = constrain( map( speed, 0, 10, 0.0, 1.0 ), 0.0, 1.0 );
  fill( lerpColor( slow, fast, normalized ) );
  ellipse( node.x, node.y, 16, 16 );
}

void mouseMoved()
{ // Stir things up with the mouse
  float fx = 20 * (mouseX - pmouseX);
  float fy = 20 * (mouseY - pmouseY);
  float d = max( 1, dist( mouseX, mouseY, node.x, node.y ) );
  float d2 = d * d;
  node.x += fx / d2;
  node.y += fy / d2;
}

void keyPressed()
{
  if ( key == 'r' )
  { // 'r' for reset
    // move the node back onto screen
    node.x = width / 2;
    node.y = height / 2;
    // resetting the node's previous positions keeps it from flying away immediately
    node.px = width / 2;
    node.py = height / 2;
  }
}

