module Algoruby
  module Search
    #
    # === Binary Search ===
    #
    # Best:   O(1)        [constant]
    # Avg:    O(n log n)  [n logarithmic]
    # Worst:  O(n log n)  [n logarithmic]
    #
    module Binary
      extend self

      #
      # NOTE: Assumes ary is sorted
      #
      def search(ary, t)
        low = 0
        high = ary.length - 1
        while low <= high
          i = (low + high) / 2
          return true if t == (val = ary[i])

          if t < val
            high = i - 1
          else
            low  = i + 1
          end
        end
        false
      end

      alias_method :include?, :search
    end
  end
end
