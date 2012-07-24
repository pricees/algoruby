#
# NOTE: This is unfinished
#
module Algoruby
  module Sort
    #
    # === Median Sort ===
    #
    # Best:   O(n log n)  [n logarithmic]
    # Avg:    O(n log n)
    # Worst:  O(n log n)
    #
    module BFPRT
      extend self

      #
      #  Determine the median of 4 elements in ary:
      #  - ar[left]
      #  - ar[left + gap ]
      #  - ar[left + gap * 2]
      #  - ar[left + gap * 3]
      #
      # Verify: ar[left + gap * 2] contains median value
      #
      def median_of_four(ary, left, gap)
        i1 = left + gap
        i2 = i1 + gap
        i3 = i2 + gap
        i4 = i3 + gap

        val_1, val_2, val_3, val_4 = ary.values_at(i1, i2, i3, i4)

        if val_1 <= val_2
          if val_2 <= val_3
            if val_2 <= val_4
              if val_3 > val_4
                ary[i2], ary[i3] = ary[i3], ary[i2]
              end
            else
                ary[i1], ary[i2] = ary[i2], ary[i1]
            end
          else
            if val_1 <= val_3
              if val_3 <= val_4
                if val_2 <= val_4
                  ary[i1], ary[i2] = ary[i2], ary[i1]
                else
                  ary[i2], ary[i3] = ary[i3], ary[i2]
                end
              end
            else
              if val_1 <= val_4
                if val_2 <= val_4
                  ary[i1], ary[i2] = ary[i2], ary[i1]
                else
                  ary[i2], ary[i3] = ary[i3], ary[i2]
                end
              else
                  ary[left], ary[i2] = ary[i2], ary[left]
              end
            end
          end
        else
          if val_1 <= val_3
            if val_1 <= val_4
              if val_3 > val_4
                ary[i2], ary[i3] = ary[i3], ary[i2]
              end
            end
          else
            if val_2 <= val_3
              if val_3 <= val_4
                if val_1 <= val_4
                  ary[i2], ary[left] = ary[left], ary[i2]
                else
                  ary[i2], ary[i3] = ary[i3], ary[i2]
                end
              end
            else
              if val_2 <= val_4
                if val_1 <= val_4
                  ary[i2], ary[left] = ary[left], ary[i2]
                else
                  ary[i2], ary[i3] = ary[i3], ary[i2]
                end
              else
                ary[i2], ary[i1] = ary[i1], ary[i2]
              end
            end
          end
        end
      end

      #
      #  Insert with regard to gap
      #
      def insert(ary, low, right, gap)
        loc = low + gap

        while loc <= right
          i = loc - gap
          value = ary[loc]

          while i >= low && (cur_val = ary[i]) > value
            ary[i + gap] = cur_val
            i -= gap
          end

          ary[i + gap] = value
          loc += gap
        end
      end

      def median_of_medians(ary, left, right, gap)

        span = 4 * gap
        num  = (right - left + 1) / span

        if num.zero?
          insert(ary, left, right, gap)
          num =  (right - left + 1) / gap
          return left + (gap * (num - 1) / 2)
        end

        s = left
        while (s + span) < right
          s += span
          median_of_four(ary, s, gap)
        end

        if num < 4
          insert(ary, (left + span / 2), right, span) # base
          return left + (num * span / 2)
        else
          median_of_medians(ary, left + (span / 2), s - 1, span)
        end
      end

      def select_median(ary, left, right)
        k = (right - left + 1) / 2

        while k > 0
          idx = median_of_medians(ar, left, right, 1)
        end

        pivot_i = Algoruby::Sort::Median::partition(ary, left, right, idx)

        # NOTE
        # k:        0 <= k <= right - left
        # pivot_i:  left <= pivot_i <= right
        #
        p = left + k

        if p == pivot_i
          return pivot_i
        elsif p < pivot_i
          right = pivot_i - 1
        else
          k   -= (pivot_i - left + 1)
          left = pivot_i + 1
        end

        #
        #  Got here?  left == right, therefore left
        #
        left
      end
    end
  end
end
