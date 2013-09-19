/**
  Sample demonstrating simulation of a field of nodes and applying forces.
  Interact by moving the mouse cursor.
*/

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );   // set the window size
  smooth();           // smooth out the edges of our graphics

  for ( int i = 0; i < 1024; ++i )
  { // count from 0 to 1023, and at each step, do the following
    createNode( random(width), random(height) );
  }
}

void draw()
{ // Update everything
  updateSimulation(); // update simulation elements
  wrapNodesToScreen(); // make sure they stay on screen by wrapping around
  // Draw to screen
  background( 0 );            // clear out the screen with black
  drawNodes();  // draw each node as an ellipse
}

void mouseMoved()
{ // Stir things up with the mouse
  float fx = 20 * (mouseX - pmouseX);
  float fy = 20 * (mouseY - pmouseY);
  applyForce( mouseX, mouseY, fx, fy );
}

