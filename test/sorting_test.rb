require File.join('.', File.dirname(__FILE__), 'test_helper')

class SortingTest

  describe Algoruby::Sort do

    before do
      @max = 100

      @ary = begin
        s = Set.new
        s << rand(@max) until s.length == @max
        s.to_a
      end
    end

    it "sorts using insertion method" do

      ary_dup = @ary.dup

      res = Algoruby::Sort::Insertion.sort ary_dup
      res.must_equal (0...@max).to_a

      refute @ary == res
    end

    describe Algoruby::Sort::Quicksort do

      it "sorts using quicksort algorithm" do

        ary_dup = @ary.dup

        res = Algoruby::Sort::Quicksort.sort ary_dup
        res.must_equal (0...@max).to_a

        refute @ary == res
      end
    end

    describe Algoruby::Sort::Median do

      it "selects kth element" do
        ary = [1, 7, 3, 8, 9, 10, 2 ]

        left, right = 0, ary.length - 1
        k = (left + right) / 2

        res = Algoruby::Sort::Median.select_kth(ary, k, left, right) + 1
        res.must_equal 3
        ary[res].must_equal 7
      end

      it "paritions array into sub arrays around a pivot" do
        ary = [1, 7, 3, 8, 9, 10, 2 ]

        left  = 0
        right = ary.length

        res = Algoruby::Sort::Median.partition(ary, left, right, 5)
        res.must_equal 6

        res = Algoruby::Sort::Median.partition(ary, left, right, 3)
        res.must_equal 4

        res = Algoruby::Sort::Median.partition(ary, left, right, 2)
        res.must_equal 2
      end

      it "sorts using median method" do

        ary_dup = @ary.dup

        res = Algoruby::Sort::Median.sort ary_dup
        res.must_equal (0...@max).to_a

        refute @ary == res
      end

      it "sorts using BFPRT median method" do
        skip

        ary_dup = @ary.dup

        res = Algoruby::Sort::BFPRT.sort ary_dup
        res.must_equal (0...@max).to_a

        refute @ary == res
      end
    end
  end
end
