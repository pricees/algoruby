module Algoruby
  module Sort
    #
    # === Counting Sort ===
    #
    # Best:   O(n)  [linear]
    # Avg:    O(n)  [linear]
    # Worst:  O(n)  [linear]
    #
    module Bucket
      extend self

      def sort(ary)
        buckets = ary.inject(Array.new(0)) do |tmp, n|
          k = n / 3
          (tmp[k] ||= []) << n
          tmp
        end

        extract(buckets, ary)
      end

      def extract(buckets, ary)
        idx = 0

        buckets.each do |b_ary|
          next if b_ary.nil?

          Algoruby::Sort::Insertion.sort(b_ary)
          b_ary.each_with_index do |el, i|
            ary[idx] = el
            idx += 1
          end
        end

        ary
      end
    end
  end
end
