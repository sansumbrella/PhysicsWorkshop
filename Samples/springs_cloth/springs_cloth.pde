/**
 Sample showing basic cloth simulation using springs.
 Click and drag to move a node.
 'r' will reset with a new pair of nodes and spring.
 */

// Declare variables
Node mouseNode;
PImage gradient;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );   // set the window size
  smooth();           // smooth out the edges of our graphics
  gradient = loadImage("gradient.png");

  createCloth( false );
}

void createCloth( boolean createDiagonalSprings )
{ 
  float column_width = 20;
  float row_height = 20;
  int columns = 10;
  int rows = 10;
  float x_offset = (width - ((columns - 1) * column_width)) / 2;
  float y_offset = (height - ((rows - 1) * row_height)) / 2; 
  Node[] cloth_nodes = new Node[rows * columns];
  for ( int row = 0; row < rows; ++row )
  {
    for ( int column = 0; column < columns; ++column )
    {
      float x = x_offset + column * column_width;
      float y = y_offset + row * row_height;
      cloth_nodes[row * columns + column] = createNode( x, y );
    }
  }

  // Horizontal connections
  for ( int y = 0; y < rows; ++y )
  {
    for ( int x = 0; x < columns - 1; ++x )
    {
      Node lhs = cloth_nodes[y * columns + x];
      Node rhs = cloth_nodes[y * columns + x + 1];
      createSpring( lhs, rhs, 1.0 );
    }
  }
  // Vertical connections
  for ( int x = 0; x < columns; ++x )
  {
    for ( int y = 0; y < rows - 1; ++y )
    {
      Node top = cloth_nodes[y * columns + x];
      Node bottom = cloth_nodes[(y + 1) * columns + x];
      createSpring( top, bottom, 1.0 );
    }
  }
  // Diagonal connections (for more rigid feel)
  if ( createDiagonalSprings )
  {
    for ( int y = 1; y < rows; ++y )
    {
      for ( int x = 0; x < columns - 1; ++x )
      {
        Node ll = cloth_nodes[y * columns + x];
        Node ur = cloth_nodes[(y - 1) * columns + x + 1];
        createSpring( ll, ur, 0.05 );
      }
    }
    for ( int y = 0; y < rows - 1; ++y )
    {
      for ( int x = 0; x < columns - 1; ++x )
      {
        Node tl = cloth_nodes[y * columns + x];
        Node lr = cloth_nodes[(y + 1) * columns + x + 1];
        createSpring( tl, lr, 0.25 );
      }
    }
  }
  // fix top corners in place
  pinNode( cloth_nodes[0] );
  pinNode( cloth_nodes[columns - 1] );
}

void draw()
{ // Update everything
  // always apply a slight downward force (like gravity)
  applyForce( 0, 0.4 );
  updateSimulation();        // update simulation elements
  if ( mouseNode != null )
  { // if a node has been grabbed, make sure it stays at the mouse position
    mouseNode.x = mouseX;
    mouseNode.px = mouseX;
    mouseNode.y = mouseY;
    mouseNode.py = mouseY;
  }
  // Draw to screen
  background( 0 );            // clear out the screen with black
  //  stroke( 255, 0, 255 );      // draw outlines and lines in magenta
  //  simulation.drawSprings();   // draw all simulated springs

  for ( Spring s : simulation.springs )
  {
    Node lhs = s.a;
    Node rhs = s.b;
    float stress = map( dist( lhs.x, lhs.y, rhs.x, rhs.y ), s.rest_length, s.rest_length * 1.6, 0.0, 1.0 );
    int index = int(constrain( stress, 0.0, 1.0 ) * (gradient.width - 1));
    color c = gradient.get( index, 0 );
    stroke( c );
    line( lhs.x, lhs.y, rhs.x, rhs.y );
  }
}

void mousePressed()
{
  // pick the closest node to the mouse
  float shortest_distance = width * height; // start with some big number
  for ( Node n : simulation.nodes )
  {
    float d = dist( n.x, n.y, mouseX, mouseY );
    if ( d < shortest_distance )
    {
      shortest_distance = d;
      mouseNode = n;
    }
  }
}

void mouseReleased()
{
  if ( mouseNode != null )
  { // release the node with force based on mouse movement
    mouseNode.x = mouseX;
    mouseNode.px = pmouseX;
    mouseNode.y = mouseY;
    mouseNode.py = pmouseY;
    mouseNode = null;
  }
}

void keyPressed()
{
  if ( key == 'r' )
  { // reset the simulation
    simulation.nodes.clear();    // remove all nodes
    simulation.springs.clear();  // remove all springs
    createCloth( false );
  }
  if ( key == 'd' )
  { // reset the simulation
    simulation.nodes.clear();    // remove all nodes
    simulation.springs.clear();  // remove all springs
    createCloth( true );
  }
}

