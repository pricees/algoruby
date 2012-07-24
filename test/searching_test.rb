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

      it "finds a needle in the set" do

        (0...99).each do |needle|
          assert Algoruby::Search::Sequential.search(@ary, needle)
        end
      end

      it "finds a needle in the set" do

        (99..105).each do |needle|
          refute Algoruby::Search::Sequential.search(@ary, needle)
        end
      end
    end

  end
end
