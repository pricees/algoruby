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

    describe Algoruby::Sort::Selection do

      it "selects the max" do

        ary = [ 1, 2, 3, 6, 5, 4]
        res = Algoruby::Sort::Selection.select_max ary
        res.must_equal 3

        ary = (1..100).to_a
        res = Algoruby::Sort::Selection.select_max ary
        res.must_equal 99

        res = Algoruby::Sort::Selection.select_max ary.reverse
        res.must_equal 0
      end

      it "sorts using selection sort algorithm" do

        ary_dup = @ary.dup

        res = Algoruby::Sort::Selection.sort ary_dup
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

    describe Algoruby::Sort::Counting do

      it "sorts using counting sort algorithm" do

        ary = [3,0,2,0,0,2,2]
        res = Algoruby::Sort::Counting.sort ary
        res.must_equal [ 0, 0, 0, 2, 2, 2, 3 ]

        res = Algoruby::Sort::Counting.sort @ary.dup
        res.must_equal (0...@max).to_a

        refute @ary == res
      end
    end
    describe Algoruby::Sort::Bucket do

      it "sorts using bucket sort algorithm" do

        ary = [3,0,2,0,0,2,2]
        res = Algoruby::Sort::Bucket.sort ary
        res.must_equal [ 0, 0, 0, 2, 2, 2, 3 ]

        res = Algoruby::Sort::Bucket.sort @ary.dup
        res.must_equal (0...@max).to_a

        refute @ary == res
      end
    end

    describe Algoruby::Sort::Heap do

      it "heapifies" do
        ary = [ 5, 3, 16, 2, 10, 14 ]
        exp = [ 16, 10, 14, 2, 3, 5 ]
        Algoruby::Sort::Heap.build_heap(ary).must_equal exp
      end

      it "builds a heap" do
        ary = (1..10).to_a

        (0...5).each do |i|
          Algoruby::Sort::Heap.
            expects(:heapify).
            with(ary, i, 10)
        end

        Algoruby::Sort::Heap.build_heap(ary)
      end

      it "sorts using heap sort algorithm" do

        res = Algoruby::Sort::Heap.sort @ary.dup
        res.must_equal (0...@max).to_a

        refute @ary == res
      end
    end
  end
end
