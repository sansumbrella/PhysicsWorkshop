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
  { // Create many new nodes
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
  fill( 255, 240, 0 );        // fill shapes with yellow
  noStroke();                 // don't draw an outline around shapes
  simulation.drawNodes();     // draw all simulated nodes
}

void mouseMoved()
{ // Stir things up with the mouse
  PVector force = new PVector( 20 * (mouseX - pmouseX), 20 * (mouseY - pmouseY) );
  PVector location = new PVector( mouseX, mouseY );
  simulation.applyForce( force, location );
}

