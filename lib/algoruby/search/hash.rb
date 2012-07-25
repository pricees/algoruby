class String
  def hash_search_code
    h = rand(10_000)

    each_byte { |byte| h = 31 * h + byte }
    h
  end
end

class Integer
  def hash_search_code
    self % 3
  end
end

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

      def load_table(c)
        c.inject(Array.new) do |ary, el|
          h = el.hash_search_code

          ary[h] ||= []
          ary[h] << el
          ary
        end
      end

      def search(c, t)
        ary = c[t.hash_search_code]

        ary && Algoruby::Search::Sequential.
          search(ary, t)
      end

      alias_method :include?, :search
    end
  end
end
