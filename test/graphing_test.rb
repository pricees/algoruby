require File.join('.', File.dirname(__FILE__), 'test_helper')

#
# The following is for the binary tree functions
#

class GraphingTest

  SOURCE = 0
  TARGET = 100

  describe Algoruby::Graph do

    before do
      vertices = [
       [ 1, SOURCE ], [ 1, 3 ], [ 1, 2 ],
       [ 2, 11 ], [ 2, TARGET ],
       [ 2, 11 ], [ 2, 10 ],
       [ 3, 4 ], [ 3, 12 ],
       [ 4, 5 ], [ 4, 13 ],
       [ 5, 6 ], [ 5, 9 ],
       [ 6, 7 ], [ 6, "s" ],
       [ 7, 8 ], [ 7, 9 ],
       [ 8, 14 ], [ 8, "s" ],
       [ 9, "t" ],
      ]
      @nodes = MiniGraphdb.simple_graph(vertices)
    end

    describe Algoruby::Graph::DepthFirst do

      it "doesn't find needle" do
        ([ TARGET, SOURCE ] + (1..14).to_a).each do |t|
          Algoruby::Graph::DepthFirst.search(@nodes[SOURCE], t).wont_be_nil
        end
      end

      it "doesn't find needle" do
        (101..105).each do |t|
          Algoruby::Graph::DepthFirst.search(@nodes[SOURCE], t).must_be_nil
        end
      end
    end
  end
end
