require File.join('.', File.dirname(__FILE__), 'test_helper')

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
  end
end
