module HTML2Wiki
  module Nodes
    class LineBreak < Node
      matches "br"

      allows :none

      level :inline

      def render
        "<br />"
      end

      register!
    end
  end
end
