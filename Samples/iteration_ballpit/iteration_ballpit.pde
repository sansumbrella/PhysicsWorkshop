/**
  Sample demonstrating gravity, avoidance, and clamping to screen.
  A ball-pit-like pseudo-fluid.
  Interact by moving the mouse cursor.
*/

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );   // set the window size
  smooth();           // smooth out the edges of our graphics

  for ( int i = 0; i < 1024; ++i )
  { // Create many new nodes
    createNode( random(width), random(height) );
  }
}

void draw()
{ // Update everything
  updateSimulation();              // update simulation elements
  constrainNodesToScreen();   // make sure they stay on screen by clamping to edges
  applyForce( 0, 0.5 );  // apply a gravity-like force
  for ( int i = 0; i < 3; ++i )
  {  // push nodes apart (multiple times to avoid jitter)
    separateNodes( 8, 0.65 );
  }
  // Draw to screen
  background( 0 );          // clear out the screen with black
  noStroke();
  drawNodes();   // draw all simulated nodes
}

void mouseMoved()
{ // Stir things up with the mouse
  float fx = 200 * (mouseX - pmouseX);
  float fy = 200 * (mouseY - pmouseY);
  applyForceQuad( fx, fy, mouseX, mouseY );
}

