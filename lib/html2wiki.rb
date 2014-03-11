require "nokogiri"

require_relative "html2wiki/node"
require_relative "html2wiki/nodes/root"
require_relative "html2wiki/nodes/text"
require_relative "html2wiki/nodes/paragraph"
require_relative "html2wiki/nodes/font"
require_relative "html2wiki/nodes/link"
require_relative "html2wiki/nodes/heading"
require_relative "html2wiki/nodes/list"
require_relative "html2wiki/nodes/list_item"
require_relative "html2wiki/nodes/line_break"
require_relative "html2wiki/converter"

module HTML2Wiki
  def self.convert(html)
    Converter.new(html).convert
  end
end
