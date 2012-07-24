module Algoruby
  module Sort
    #
    # === Quicksort Sort ===
    #
    # Best:   O(n log n)  [n logarithmic]
    # Avg:    O(n log n)
    # Worst:  O(n^2)      [quadratic]
    #
    module Quicksort
      extend self

      #
      #  Quick Sort using Median Sort when needed, Insertion sort when
      #  optimized
      #
      def do_qsort(ary, left = 0, right = ary.length - 1, min_size)

        return ary if right <= left

        tmp_pi  = select_pivot_index(ary, left, right)
        pivot_i = partition(ary, left, right, tmp_pi)

        if (pivot_i - 1 - left) <= min_size
          insertion(ary, left, pivot_i - 1)
        else
          do_qsort(ary, left, pivot_i -1 )
        end

        if (right - pivot_i - 1) <= min_size
          insertion(ary, pivot_i + 1, right)
        else
          do_qsort(ary, pivot_i + 1, right)
        end
      end

      class << self
        alias_method :sort_pointers, :do_qsort
      end

      #
      # Traditional qsort
      #

      def sort(ary, left = 0, right = ary.length - 1)

        if left < right
          pi = partition(ary, left, right)
          sort(ary, left, pi - 1)
          sort(ary, pi + 1, right)
        end

        ary
      end

      def partition(ary, left, right)

        pivot_i = (right - left) / 2 + left

        ary[pivot_i], ary[right] = ary[right], ary[pivot_i]
        store = left

        (left...right).each do |i|

          if ary[i] <= ary[right]
            ary[store], ary[i] = ary[i], ary[store]
            store += 1
          end
        end

        ary[store], ary[right] = ary[right], ary[store]
        store
      end
    end
  end
end
