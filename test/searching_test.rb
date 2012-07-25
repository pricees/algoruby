require File.join('.', File.dirname(__FILE__), 'test_helper')

#
# The following is for the binary tree functions
#

class SearchingTest


  describe Algoruby::Search do

    before do
      @max = 99

      @ary = begin
        s = Set.new
        s << rand(@max) until s.length == @max
        s.to_a
      end
    end

    describe Algoruby::Search::Sequential do

      it "finds needle" do
        (0..9).each do |t|
          assert Algoruby::Search::Sequential.search(@ary, t)
        end
      end

      it "doesn't find needle" do
        (99..105).each do |t|
          refute Algoruby::Search::Sequential.search(@ary, t)
        end
      end
    end

    describe Algoruby::Search::Binary do

      it "finds needle" do
        (0..9).each do |t|
          assert Algoruby::Search::Binary.search(@ary.sort, t)
        end
      end

      it "doesn't find needle" do
        (99..105).each do |t|
          refute Algoruby::Search::Binary.search(@ary, t)
        end
      end
    end

    describe Algoruby::Search::Hash do

      it "finds needle" do
        ary = Algoruby::Search::Hash.load_table(@ary)

        (0..9).each do |t|
          assert Algoruby::Search::Hash.search(ary, t)
        end
      end

      it "doesn't find needle" do
        ary = Algoruby::Search::Hash.load_table(@ary)

        (99..105).each do |t|
          refute Algoruby::Search::Hash.search(ary, t)
        end
      end
    end

    describe Algoruby::Search::BinaryTree do

      # Open class for binary tree
      class ::Numeric; attr_accessor :left, :right; end

      before do

        # Root: 4
        node = 4
        node.left  = 2
        node.right = 6

        # Left child 2
        node.left.left  = 1
        node.left.right = 3

        # Right child 6
        node.right.left = 5

        @binary_tree = node
      end

      it "finds needle" do
        (1..6).each do |t|
          assert Algoruby::Search::BinaryTree.search(@binary_tree, t)
        end
      end

      it "doesn't find needle" do
        (99..105).each do |t|
          refute Algoruby::Search::BinaryTree.search(@binary_tree, t)
        end
      end
    end
  end
end
