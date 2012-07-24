module Algoruby
  module Sort
    #
    # === Selection Sort ===
    #
    # Best:   O(n^2)  [quadratic]
    # Avg:    O(n^2)  [quadratic]
    # Worst:  O(n^2)  [quadratic]
    #
    module Selection

      def self.select_max(ary, left = 0, right = ary.length - 1)
        max_pos = left

        ary[left..right].each_with_index do |num, idx|
          max_pos = left + idx if num > ary[max_pos]
        end
        max_pos
      end

      def self.sort(ary, n = ary.length - 1)
       n.downto(1).each do |idx|
          max_pos = select_max(ary, 0, idx)
          unless max_pos == idx
            ary[idx], ary[max_pos] = ary[max_pos], ary[idx]
          end
       end

        ary
      end

      class << self
        alias_method :sort_pointers, :sort
      end
    end
  end
end
