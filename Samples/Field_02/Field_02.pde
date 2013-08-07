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
  simulation.update();              // update simulation elements
  simulation.constrainToScreen();   // make sure they stay on screen by clamping to edges
  simulation.applyForce( new PVector( 0, 0.5 ) );  // apply a gravity-like force
  for ( int i = 0; i < 3; ++i )
  {  // push nodes apart (multiple times to avoid jitter)
    simulation.separateNodes( 8, 0.65 );
  }
  // Draw to screen
  background( 0 );          // clear out the screen with black
  fill( 255, 0, 240 );      // fill shapes with magenta
  noStroke();               // don't draw an outline around shapes
  simulation.drawNodes();   // draw all simulated nodes
}

void mouseMoved()
{ // Stir things up with the mouse
  PVector force = new PVector( 200 * (mouseX - pmouseX), 200 * (mouseY - pmouseY) );
  PVector location = new PVector( mouseX, mouseY );
  simulation.applyForceQuad( force, location );
}

