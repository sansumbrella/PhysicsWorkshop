/**
  Sample demonstrating simulation of a field of nodes and applying forces.
  Interact by moving the mouse cursor.
*/

// Declare variables
SimpleSimulation simulation;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );   // set the window size
  smooth();           // smooth out the edges of our graphics
  simulation = new SimpleSimulation();

  for ( int i = 0; i < 1024; ++i )
  { // count from 0 to 1023, and at each step, do the following
    Node node = new Node( random(width), random(height) );
    simulation.addNode( node );
  }
}

void draw()
{ // Update everything
  simulation.update();        // update simulation elements
  simulation.wrapToScreen();  // make sure they stay on screen by wrapping around
  // Draw to screen
  background( 0 );            // clear out the screen with black
  for( Node n : simulation.nodes )
  { // for each Node in the simulation's collection of nodes
    // draw an ellipse at the node's position
    ellipse( n.x, n.y, 12, 12 );
  }
}

void mouseMoved()
{ // Stir things up with the mouse
  PVector force = new PVector( 20 * (mouseX - pmouseX), 20 * (mouseY - pmouseY) );
  PVector location = new PVector( mouseX, mouseY );
  simulation.applyForce( force, location );
}

