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

    def self.build(name, *args)
      if block_given?
        "<#{name}#{parse_attrs(args)}>#{yield}</#{name}>"
      else
        "<#{name}#{parse_attrs(args)}>"
      end
    end
  end
end
