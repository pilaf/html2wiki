module HTML2Wiki
  module Nodes
    class Heading < Node
      matches /h[1-6]/

      allows %w(a i b strong em span)

      level :block

      def render
        "#{eq_signs} #{render_content} #{eq_signs}"
      end

      private

      def eq_signs
        "=" * html_node.name[-1].to_i
      end

      register!
    end
  end
end
