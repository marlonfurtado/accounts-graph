require 'graphviz'
require_relative 'reader'

file = ARGV[0]
reader = Reader.new file
data = reader.data

data.shift  # Remove first
data.pop  # Remove last

accounts = data.map {|x| x[/\d+/]}  # All account numbers

# Create a new graph
graph = GraphViz.new( :G, :type => :graph )

accounts.each do |node|
    # Create nodes
    graph.add_nodes(node.to_s)
end

for i in 0...accounts.size
    nodei = data[i].split(" ")[0]
    name_i1 = data[i].split(" ")[1]
    name_i2 = data[i].split(" ")[2]

    for j in i+1...accounts.size
        nodej = data[j].split(" ")[0]
        name_j1 = data[j].split(" ")[1]
        name_j2 = data[j].split(" ")[2]
 
        if(name_i1 == name_j1)
            puts "Adding edges to nodes:  #{nodei} -- #{nodej}"
            graph.add_edges( nodei.to_s, nodej.to_s, :label => "#{name_i1}" )
        elsif(name_i1 == name_j2)
            puts "Adding edges to nodes:  #{nodei} -- #{nodej}"
            graph.add_edges( nodei.to_s, nodej.to_s, :label => "#{name_i1}" )
        elsif(name_i2 == name_j1)
            puts "Adding edges to nodes:  #{nodei} -- #{nodej}"
            graph.add_edges( nodei.to_s, nodej.to_s, :label => "#{name_i2}" )
        elsif(name_i2 == name_j2)
            puts "Adding edges to nodes:  #{nodei} -- #{nodej}"
            graph.add_edges( nodei.to_s, nodej.to_s, :label => "#{name_i2}" )
        end

    end
end

# Generate output image
graph.output( :png => File.join(File.dirname(__FILE__), "../img/#{file}.png"))