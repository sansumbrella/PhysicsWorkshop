// Declare variables
SimpleSimulation simulation;
Node mouseNode;

void setup()
{ // Set sketch parameters
  // and initialize all of our variables
  size( 800, 600 );   // set the window size
  smooth();           // smooth out the edges of our graphics
  simulation = new SimpleSimulation();

  createSpring();
}

void createSpring()
{ // Create two nodes and connect them with a spring
  float x1 = random( width * 0.2, width * 0.8 );
  float y1 = random( height * 0.2, height * 0.8 );
  float x2 = x1 + random( -width / 4, width / 4 );
  float y2 = y1 + random( -height / 4, height / 4 );
  Node a = new Node( x1, y1 );
  Node b = new Node( x2, y2 );
  Spring spring = new Spring( a, b, 0.5 );
  simulation.addNode( a );
  simulation.addNode( b );
  simulation.addSpring( spring );
}

void draw()
{ // Update everything
  simulation.update();        // update simulation elements
  if( mouseNode != null )
  {
    mouseNode.x = mouseX;
    mouseNode.px = mouseX;
    mouseNode.y = mouseY;
    mouseNode.py = mouseY;
  }
  // Draw to screen
  background( 0 );            // clear out the screen with black
  stroke( 255, 0, 255 );      // draw outlines and lines in magenta
  simulation.drawSprings();   // draw all simulated springs
  fill( 255, 240, 0 );        // fill shapes with yellow
  noStroke();                 // don't draw an outline around shapes
  simulation.drawNodes();     // draw all simulated nodes
}

void mousePressed()
{
  // pick the closest node to the mouse
  float shortest_distance = width * height; // start with some big number
  for( Node n : simulation.nodes )
  {
    float d = dist( n.x, n.y, mouseX, mouseY );
    if( d < shortest_distance )
    {
      shortest_distance = d;
      mouseNode = n;
    }
  }
}

void mouseReleased()
{
  if( mouseNode != null )
  {
    mouseNode.x = mouseX;
    mouseNode.px = pmouseX;
    mouseNode.y = mouseY;
    mouseNode.py = pmouseY;
  }
  mouseNode = null;
}

void keyPressed()
{
  if( key == 'r' )
  {
    simulation.nodes.clear();
    simulation.springs.clear();
    createSpring();
  }
}

