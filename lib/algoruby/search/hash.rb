module Algoruby
  module Search
    #
    # === Hash Sort ===
    #
    # Best:   O(1)  [constant]
    # Avg:    O(1)  [constant]
    # Worst:  O(n)  [linear]
    #
    module Hash
      extend self

      def hash(i)
        i % 3
      end

      def load_table(c)
        c.inject(Array.new) do |ary, el|
          h = hash(el)

          ary[h] ||= []
          ary[h] << el
          ary
        end
      end

      def search(ary, t)
        h = hash(t)

        ary[h] && Algoruby::Search::Sequential.
          search(ary[h], t)
      end

      alias_method :include?, :search
    end
  end
end
