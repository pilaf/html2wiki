module HTML2Wiki
  module Nodes
    class Root < Node
      allows %w(h1 h2 h3 h4 h5 h6 p ul)

      ignore_whitespace

      def render
        @children.map(&:render).join("\n\n")
      end
    end
  end
end
