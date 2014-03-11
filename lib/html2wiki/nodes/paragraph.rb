module HTML2Wiki
  module Nodes
    class Paragraph < Node
      matches "p"

      allows %w(a b i strong em br)

      level :block

      register!
    end
  end
end
