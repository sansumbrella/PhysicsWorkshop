// Declare variables
color slow;
color fast;
Node lonely_node;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );      // set the window size
  smooth();              // smooth out the edges of our graphics
  lonely_node = createNode( width / 2 , height / 2 );
  colorMode( HSB, 1.0 );
  slow = color( 0.6, 1.0, 1.0 );
  fast = color( 1.0, 1.0, 1.0 );
}

void draw()
{ // Update everything
  updateSimulation(); // update simulation elements
  // Draw to screen
  background( 0 );            // clear out the screen with black
  // speed is how far we traveled
  float speed = dist( lonely_node.x, lonely_node.y, lonely_node.px, lonely_node.py );
  float normalized = constrain( map( speed, 0, 10, 0.0, 1.0 ), 0.0, 1.0 );
  fill( lerpColor( slow, fast, normalized ) );
  ellipse( lonely_node.x, lonely_node.y, 16, 16 );
}

void mouseMoved()
{ // Stir things up with the mouse
  float fx = 2 * (mouseX - pmouseX);
  float fy = 2 * (mouseY - pmouseY);
  applyForce( fx, fy, mouseX, mouseY );
}

void keyPressed()
{
  if ( key == 'r' )
  { // 'r' for reset
    // move the node back onto screen
    lonely_node.setPosition( width / 2, height / 2 );
  }
}

