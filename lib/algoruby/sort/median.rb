module Algoruby
  module Sort
    #
    # === Median Sort ===
    #
    # Best:   O(n log n)  [n logarithmic]
    # Avg:    O(n log n)
    # Worst:  O(n^2)      [quadratic]
    #
    module Median
      extend self

      #
      #  Select the kth element of an ary where
      #  1 <= k <= (right - left)  + 1
      #
      def select_kth(ary, k, left, right)

        tmp_i  = (right - left) / 2 + left
        pivot_i = partition(ary, left, right, tmp_i)

        return pivot_i if (left + k - 1) == pivot_i

        #
        # Continue to narrow range as appropriate
        #
        if (left + k - 1) < pivot_i
          select_kth(ary, k, left, pivot_i - 1)
        else
          select_kth(ary, k - (pivot_i - left + 1), pivot_i + 1, right)
        end
      end

      #
      #  Finds pivot index
      #  Everything to the left is less-than-or-equal
      #  Everything to the right is greater-than
      #
      def partition(ary, left, right, pivot_i)

        left  = 0
        right = ary.length - 1

        pivot = ary[pivot_i]

        # Move pivot to the end of ary
        ary[pivot_i], ary[right] = ary[right], ary[pivot_i]

        # All values <= pivot moved to front of ary
        # Pivot inserted after them
        store = left
        (left...right).each do |i|
          if ary[i] <= pivot
            ary[i], ary[store] = ary[store], ary[i]
            store += 1
          end
        end

        ary[store], ary[right] = ary[right], ary[store]
        store
      end

      def median_sort(ary, left = 0, right = ary.length - 1)

        return ary if (right <= left)

        mid = (right - left + 1 ) / 2
        me  = select_kth(ary, mid + 1, left, right)

        median_sort(ary, left, left + mid - 1)
        median_sort(ary, left + mid + 1, right)
      end

      class << self
        alias_method :sort, :median_sort
      end
    end
  end
end

