Node a;
Node b;
Node c;

Node mouseNode = null;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );      // set the window size
  smooth();              // smooth out the edges of our graphics
  a = createNode( width / 2, height / 2 );
  b = createNode( width / 2 + 100, height / 2 );
  c = createNode( width / 2 + 100, height / 2 + 100 );
  createSpring( a, b );
  createSpring( b, c );
  createSpring( a, c );
  pinNode( a );
}

void draw()
{ // clear out the screen with black
  background( 0 );
  if ( mouseNode != null )
  { // if a node has been grabbed, make sure it stays at the mouse position
    mouseNode.setPosition( mouseX, mouseY );
  }
  // update simulation elements
  updateSimulation();
  applyForce( 0, 1.0 );
  constrainNodesToScreen();
  // draw all nodes as ellipses
//  drawNodes();
//  drawSprings();
  beginShape();
  vertex( a.x, a.y );
  vertex( b.x, b.y );
  vertex( c.x, c.y );
  vertex( a.x, a.y );
  endShape();
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

