module Algoruby
  module Sort
    #
    # === Insertion Sort ===
    #
    # Best:   O(n)    [linear]
    # Avg:    O(n)
    # Worst:  O(n^2)  [quadratic]
    #
    # When to use:
    #   - Small number of unordered elements
    #   - Collection nearly sorted
    #
    module Insertion

      def self.insert ary, pos
        value = ary[pos]
        i     = pos - 1

        while (i >= 0) && ary[i] > value
          ary[i+1] = ary[i]
          i -= 1
        end

        ary[i+1] = value
      end

      def self.sort(ary)
        (1...ary.length).each do |i|
          insert(ary, i)
        end

        ary
      end
    end
  end
end
