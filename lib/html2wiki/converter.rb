module HTML2Wiki
  class Converter
    def initialize(html)
      @html = html
      fragment = Nokogiri::HTML::DocumentFragment.parse(@html)
      @root_node = Nodes::Root.new(fragment)
    end

    def convert
      @root_node.render
    end
  end
end
