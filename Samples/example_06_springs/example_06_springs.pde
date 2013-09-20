/**
 Sample showing mouse interaction with nodes connected by a spring.
 Click and drag to move a node.
 'r' will reset with a new pair of nodes and spring.
 */

// The mouseNode is the node a user has grabbed with their mouse (if any)
// this will let us interact with the spring system
Node mouseNode = null;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );   // set the window size
  smooth();           // smooth out the edges of our graphics
  createRandomSpringConnection();
}

void createRandomSpringConnection()
{ // Create two nodes and connect them with a spring
  // generate random screen positions
  float x1 = random( width * 0.2, width * 0.8 );
  float y1 = random( height * 0.2, height * 0.8 );
  float x2 = x1 + random( -width / 4, width / 4 );
  float y2 = y1 + random( -height / 4, height / 4 );
  Node a = createNode( x1, y1 );
  Node b = createNode( x2, y2 );
  createSpring( a, b, 0.5 );  // create a spring between nodes a and b
}

void draw()
{ // Update everything
  updateSimulation();        // update simulation elements
  if ( mouseNode != null )
  { // if a node has been grabbed, make sure it stays at the mouse position
    mouseNode.setPosition( mouseX, mouseY );
  }
  // Draw to screen
  background( 0 );            // clear out the screen with black
  stroke( 255 );      // draw outlines and lines in white
  drawSprings();              // draw all simulated springs as lines
  fill( 255 );        // fill shapes with white
  noStroke();                 // don't draw an outline around shapes
  drawNodes();                // draw all simulated nodes as ellipses
}

void mousePressed()
{ // pick the closest node to the mouse
  mouseNode = nearestNode( mouseX, mouseY );
}

void mouseReleased()
{
  if ( mouseNode != null )
  { // release the node with force based on mouse movement
    mouseNode.x = mouseX;
    mouseNode.y = mouseY;
    mouseNode = null;
  }
}

void keyPressed()
{
  if ( key == 'r' )
  { // reset the simulation
    clearSimulation();
    createRandomSpringConnection();   // create a new spring connection
  }
}

