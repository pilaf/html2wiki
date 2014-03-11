module HTML2Wiki
  module Nodes
    class Link < Node
      matches "a"

      allows :none

      level :inline

      def render
        content = render_content
        if content.strip == html_node["href"]
          html_node["href"]
        else
          "[#{html_node["href"]} #{content}]"
        end
      end

      register!
    end
  end
end
