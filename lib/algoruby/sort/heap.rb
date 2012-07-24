module Algoruby
  module Sort
    #
    # === Heap Sort ===
    #
    # Best:   O(n log n)  [n logarithmic]
    # Avg:    O(n log n)  [n logarithmic]
    # Worst:  O(n log n)  [n logarithmic]
    #
    module Heap
      extend self

      def sort(ary, n = ary.length - 1)
        build_heap(ary)

        n.downto(1).each do |i|
          ary[0], ary[i] = ary[i], ary[0]
          heapify(ary, 0, i)
        end

        ary
      end

      def build_heap(ary, n = ary.length)
        (n / 2 - 1).downto(0).each do |i|
          heapify(ary, i, n)
        end

        ary
      end

      def heapify(ary, i, max = ary.length - 1)
        left  = 2 * i + 1
        right = left + 1   # XXX: 2 * i + 2

        if left < max && ary[left] > ary[i]
          largest = left
        else
          largest = i
        end

        if right < max && ary[right] > ary[largest]
          largest = right
        end

        if largest != i
          ary[i], ary[largest] = ary[largest], ary[i]
          heapify(ary, largest, max)
        end

        ary
      end
    end
  end
end
