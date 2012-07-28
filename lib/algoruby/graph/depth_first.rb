require 'mini_graphdb'
module Algoruby
  module Graph
    #
    # === DepthFirst Search ===
    #
    # Best:   O(V+E)
    # Avg:    O(V+E)
    # Worst:  O(V+E)
    #
    module DepthFirst
      extend self

      def visited(reset = false)
        @visited = nil if reset
        @visited ||=  {}
      end

      def search(node, target = 0)

        unless visited.key?(node.val)
          visited[node.val] = node

          node.edges.byweight.each do |other_node|
            search(other_node, target)
          end
        end

        visited[target]
      end

      # Public: Perform Depth-First Search starting
      #
      # s           - Starting vertex
      # discovered  - When vertex first discovered (default: []
      # finished    - When all edges for vertext are processed (default
      #
      # predecessor - Preceding vertex to u
      # labels      - Edge labels
      #
      # Examples
      #
      #  search(foo, s)
      #
      # Returns true or false
      def df_search(full_graph,
                 source,
                 discovered  = [],
                 finished    = [],
                 predecessor = [],
                 labels      = [])
        ctr   = 0
        graph = full_graph[source]
        n     = graph.edges.size
        color = Array.new(n, :white)

        discovered.fill(-1, 0, n)
        finished.fill(-1, 0, n)
        predecessor.fill(-1, 0, n)
        labels.clear


        dfs_visit(graph,
                  source,
                  discovered,
                  finished,
                  predecessor,
                  color,
                  ctr,
                  labels)
        nodes = graph.edges.byweight
        nodes.each do |node|
          dfs_visit(node, node,
                    discovered,
                    finished,
                    predecessor,
                    color,
                    ctr,
                    labels)
        end
      end

      def dfs_visit(graph, u,
                    predecessor,
                    discovered,
                    finished,
                    color,
                    ctr,
                    labels)
        color[u] = :gray

        discovered[u] = (ctr += 1)

        graph.edges.byweight.each do |node|
          if color[node] == :white
            type = :tree
          elsif color[node] == :gray
            type = :backward
          elsif discovered[u] < discovered[node]
            type = :forward
          else
            type = :cross
          end

          labels << edge_label(u, node, type)

          if color[node] == :white
            predecessor[node] = u

            dfs_visit(graph, u,
              predecessor,
              discovered,
              finished,
              color,
              ctr,
              labels)
          end
        end

        color[u]    = :black
        finished[u] = (ctr += 1)
      end

      alias_method :include?,   :search
      alias_method :dfs_search, :search
    end
  end
end
