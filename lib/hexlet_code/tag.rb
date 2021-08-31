# frozen_string_literal: true

# module HexletCode
module HexletCode
  # module Tag
  module Tag
    def self.parse_attrs(attrs)
      result = ' '
      attrs.each do |a|
        a.each do |k, v|
          result += case v
                    when true
                      k.to_s
                    when false
                      ''
                    else
                      "#{k}=\"#{v}\" "
                    end
        end
      end

      result.rstrip
    end

    def self.to_html(tag, *args)
      # It should be two lists with single and paired tags,
      # but there are too many tags and some of them might
      # be as single as paired
      if block_given?
        "<#{tag}#{parse_attrs(args)}>#{yield}</#{tag}>"
      else
        "<#{tag}#{parse_attrs(args)}>"
      end
    end
  end
end
