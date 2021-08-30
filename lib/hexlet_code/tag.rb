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
      # По уму должно быть два массива с парными и одинарными тегами,
      # но тегов слишком много и некоторые из них могуть быть как
      # парными, так и одинарными
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
