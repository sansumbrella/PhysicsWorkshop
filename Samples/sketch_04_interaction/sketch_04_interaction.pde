/**
 Sample showing mouse interaction with nodes connected by a spring.
 Click and drag to move a node.
 'r' will reset with a new pair of nodes and spring.
 */

// Declare variables
SimpleSimulation simulation;
Node node;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );   // set the window size
  smooth();           // smooth out the edges of our graphics
  simulation = new SimpleSimulation();
  node = new Node( width / 2, height / 2 );
  simulation.addNode( node );
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
  simulation.applyForceQuad( force, location );
}

