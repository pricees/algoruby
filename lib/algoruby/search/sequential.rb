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

      def search(ary, t)
        ary.each { |el| t == el && (return true) }
        false
      end

      alias_method :include?, :search
    end
  end
end
