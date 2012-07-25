module Algoruby
  module Search
    #
    # === BinaryTree Sort ===
    #
    # Best:   O(log n)  [logarithmic]
    # Avg:    O(log n)  [logarithmic]
    # Worst:  O(log n)  [logarithmic]
    #
    module BinaryTree
      extend self

      def search(root, t)

        node = root
        while node
          return true if node == t

          if t < node
            node = node.left
          else
            node = node.right
          end
        end

        false
      end

      alias_method :include?, :search
    end
  end
end
