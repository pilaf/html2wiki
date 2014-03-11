module HTML2Wiki
  module Nodes
    class ListItem < Node
      matches "li"

      allows %w(a b i strong em br ul ol)

      level :block

      def render_content
        "".tap do |r|
          has_inline = false
          @children.each do |child|
            has_inline = true if child.inline?
            r << "\n" if has_inline && child.kind_of?(Nodes::List)
            r << child.render
          end
        end
      end

      register!
    end
  end
end
