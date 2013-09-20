// Physics interface (functions to do things)

// create a node at position x, y on screen
Node createNode( float x, float y )
{
  return simulation.createNode( x, y );
}

// Create a spring between two nodes
Spring createSpring( Node a, Node b )
{
  return simulation.createSpring( a, b, 1.0 );
}

// Create a spring between two nodes
Spring createSpring( Node a, Node b, float tension )
{
  return simulation.createSpring( a, b, tension );
}

void drawSprings()
{
  simulation.drawSprings();
}

void drawNodes() {
  simulation.drawNodes();
}

// returns the Node nearest point x, y (if any)
// if there are no nodes in the simulation, returns null
Node nearestNode( float x, float y )
{
  Node ret = null;
  if ( simulation.nodes.size() > 0 )
  {
    ret = simulation.nodes.get( 0 );
    float shortest_distance = dist( ret.x, ret.y, x, y );
    for ( Node n : simulation.nodes )
    {
      float d = dist( n.x, n.y, x, y );
      if ( d < shortest_distance )
      {
        shortest_distance = d;
        ret = n;
      }
    }
  }
  return ret;
}

void separateNodes( float minDist, float stiffness )
{
  simulation.separateNodes( minDist, stiffness );
}

// Move nodes around to other side of screen when they move out of bounds
void wrapNodesToScreen()
{
  simulation.wrapNodesToScreen();
}

// Don't let nodes move past edge of screen
void constrainNodesToScreen()
{
  simulation.constrainNodesToScreen();
}


void updateSimulation()
{
  simulation.update();
}
// apply a force to all nodes in the simulation
// the effect falls off linearly with node distance from location
void applyForce( float fx, float fy, float x, float y )
{
  for ( Node n : simulation.nodes )
  {
    float d = max( 1, dist( x, y, n.x, n.y ) );
    n.x += fx / d;
    n.y += fy / d;
  }
}

void applyForce( float fx, float fy )
{
  for ( Node n : simulation.nodes )
  {
    n.x += fx;
    n.y += fy;
  }
}

// apply a force to all nodes in the simulation
// the effect falls off quadratically with node distance from location
void applyForceQuad( float fx, float fy, float x, float y )
{
  for ( Node n : simulation.nodes )
  {
    float d = max( 1, dist( x, y, n.x, n.y ) );
    n.x += fx / (d * d);
    n.y += fy / (d * d);
  }
}

void pinNode( Node node )
{
  simulation.pinNode( node );
}

void clearSimulation()
{
  simulation.clear();
}

