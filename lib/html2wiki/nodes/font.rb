module HTML2Wiki
  module Nodes
    class Font < Node
      matches %w(i b strong em span)

      allows %w(a b i strong em span br)

      level :inline

      def render
        "#{wrapper}#{render_content}#{wrapper}"
      end

      private

      def wrapper
        case html_node.name
        when "b", "strong"
          "'''"
        when "i", "em"
          "''"
        when "span"
          ""
        end
      end

      register!
    end
  end
end
