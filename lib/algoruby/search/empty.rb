module Algoruby
  module Search
    #
    # === EMPTY Sort ===
    #
    # Best:   O(n^2)  [quadratic]
    # Avg:    O(n^2)  [quadratic]
    # Worst:  O(n^2)  [quadratic]
    #
    module EMPTY

      def search(t, ary = self)
        true
      end

      alias_method :include?, :search
    end
  end
end
