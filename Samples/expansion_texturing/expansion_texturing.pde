Node a;
Node b;
Node c;

Node mouseNode = null;
PImage texture;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 1024, 768, P3D ); // set the window size
  smooth();              // smooth out the edges of our graphics
  texture = loadImage( "texture.jpg" );
  a = createNode( width / 2, height / 2 );
  b = createNode( width / 2 + 300, height / 2 );
  c = createNode( width / 2 + 300, height / 2 + 300 );
  createSpring( a, b );
  createSpring( b, c );
  createSpring( c, a, 0.5 );
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
  texture( texture );
  vertex( a.x, a.y, 0, 0 );
  vertex( b.x, b.y, 1024, 0 );
  vertex( c.x, c.y, 1024, 1024 );
  vertex( a.x, a.y, 0, 0 );
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

