require 'graphviz'

# Create a new graph
g = GraphViz.new( :G, :type => :digraph )

# Create two nodes
n1 = g.add_nodes( "01" )
n2 = g.add_nodes( "02" )
n3 = g.add_nodes( "03" )
n4 = g.add_nodes( "04" )
n5 = g.add_nodes( "05" )

# Create an edge between the two nodes
g.add_edges( n1, n2 )
g.add_edges( n2, n3 )
g.add_edges( n2, n4 )
g.add_edges( n1, n5 )
g.add_edges( n5, n4 )

# Generate output image
g.output( :png => File.join(File.dirname(__FILE__), '../img/example.png'))
