# frozen_string_literal: true

# module HexletCode
module HexletCode
  # module Tag
  module Tag
    def self.parse_attrs(attrs)
      result = " "
      attrs.each do |a|
        a.each { |k, v| result += "#{k}=\"#{v}\" " }
      end
      result.rstrip
    end

    def self.build(tag, *args)
      # It should be two lists with single and paired tags,
      # but there are too many tags and some of them might
      # be as single as paired
      if block_given?
        "<#{tag}#{parse_attrs(args)}>#{yield}</#{tag}>"
      elsif tag == "form"
        "<#{tag}#{parse_attrs(args)}></#{tag}>"
      else
        "<#{tag}#{parse_attrs(args)}>"
      end
    end
  end
end
