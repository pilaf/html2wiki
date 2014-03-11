module HTML2Wiki
  class Node
    class << self
      def allows(tagnames)
        @allowed_tags = tagnames
      end

      def ignore_whitespace
        @ignore_whitespace = true
      end

      def ignore_whitespace?
        @ignore_whitespace
      end

      def level(level)
        raise "level must be one of :inline or :block" unless level == :inline || level == :block
        @level = level
      end

      def inline?
        @level == :inline
      end

      def block?
        @level == :block
      end

      def allows?(tagname)
        return false unless @allowed_tags
        return false if @allowed_tags == :none
        return true if @allowed_tags == :all
        (@allowed_tags || []).include?(tagname)
      end

      def matches(matcher)
        @matcher = matcher
      end

      def match(html_node)
        if @matcher.respond_to?(:call)
          @matcher.call(html_node.name)
        elsif @matcher.respond_to?(:include?)
          @matcher.include?(html_node.name)
        else
          @matcher === html_node.name
        end
      end

      def new_by_html_node(html_node)
        find_handler(html_node).new(html_node)
      end

      def register(handler)
        @handlers ||= []
        @handlers << handler
      end

      def register!
        Node.register(self)
      end

      private

      def find_handler(html_node)
        @handlers.find {|h| h.match(html_node) }
      end
    end

    attr_reader :html_node

    def initialize(html_node)
      @html_node = html_node
      @children = []

      @html_node.children.each do |child|
        if child.kind_of?(Nokogiri::XML::Text)
          unless ignore_whitespace? && child.content.match(/\A\s+\Z/)
            @children << Nodes::Text.new(child)
          end
        elsif child.kind_of?(Nokogiri::XML::Node)
          if allows?(child.name)
            @children << Node.new_by_html_node(child)
          end
        end
      end
    end

    def render
      render_content
    end

    def render_content
      "".tap do |r|
        @children.each {|child| r << child.render }
      end
    end

    def allows?(tagname)
      self.class.allows?(tagname)
    end

    def ignore_whitespace?
      self.class.ignore_whitespace?
    end

    def inline?
      self.class.inline?
    end

    def block?
      self.class.block?
    end
  end
end
