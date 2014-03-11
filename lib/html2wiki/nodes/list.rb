module HTML2Wiki
  module Nodes
    class List < Node
      matches %w(ul ol)

      allows ["li"]

      level :block

      ignore_whitespace

      def render
        content = render_content
        content.gsub(/^/, list_prefix).gsub(/^([#*]+)\s*/, "\\1 ")
      end

      def render_content
        "".tap do |r|
          @children.each do |child|
            r << child.render << "\n"
          end
        end.chomp
      end

      private

      def list_prefix
        html_node.name == "ul" ? "*" : "#"
      end

      register!
    end
  end
end

