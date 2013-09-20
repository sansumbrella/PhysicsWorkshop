void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );      // set the window size
  smooth();              // smooth out the edges of our graphics
  createNode( width / 2 , height / 2 );
}

void draw()
{ // clear out the screen with black
  background( 0 );
  // update simulation elements
  updateSimulation();
  // draw all nodes as ellipses
  drawNodes();
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
    clearSimulation();
    createNode( width / 2, height / 2 );
  }
}

