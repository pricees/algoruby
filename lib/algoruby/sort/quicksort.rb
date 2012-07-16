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

      def self.sort(ary, left = 0, right = ary.length - 1)

        if left < right
          pi = partition(ary, left, right)
          sort(ary, left, pi - 1)
          sort(ary, pi + 1, right)
        end

        ary
      end

      def self.partition(ary, left, right)

        pivot_i = rand(right - left) + left

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
