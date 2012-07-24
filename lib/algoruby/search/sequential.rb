module Algoruby
  module Search
    #
    # === Sequential Search ===
    #
    # Best:   O(n)  [linear]
    # Avg:    O(n)  [linear]
    # Worst:  O(n)  [linear]
    #
    module Sequential
      extend self

      def search(haystack = self, needle)
        haystack.each { |el| needle == el && (return true) }

        false
      end
    end
  end
end
