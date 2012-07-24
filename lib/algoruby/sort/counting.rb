#
# NOTE: This is unfinished
#
module Algoruby
  module Sort
    #
    # === Counting Sort ===
    #
    # Best:   O(n)  [linear]
    # Avg:    O(n)  [linear]
    # Worst:  O(n)  [linear]
    #
    module Counting

      def self.sort(ary)
        buckets = ary.inject(Array.new) do |tmp, n|
          tmp[n] ||= 0
          tmp[n]  += 1
          tmp
        end
        idx = 0

        buckets.each_with_index do |n, i|
          n && n.times do
            ary[idx] = i
            idx += 1
          end
        end

        ary
      end
    end
  end
end
