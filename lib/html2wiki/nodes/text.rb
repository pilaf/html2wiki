module HTML2Wiki
  module Nodes
    class Text < Node
      matches Nokogiri::XML::Text

      level :inline

      def render
        html_node.content.gsub(/\s+/, " ")
      end
    end
  end
end
