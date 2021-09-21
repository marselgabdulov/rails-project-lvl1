# frozen_string_literal: true

# module HexletCode
module HexletCode
  # module Tag
  module Tag
    SINGLE_TAGS = %i[img :br :input].freeze

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
      if SINGLE_TAGS.include?(tag.to_sym)
        "<#{tag}#{parse_attrs(args)}>"
      else
        "<#{tag}#{parse_attrs(args)}>#{yield}</#{tag}>"
      end
    end
  end
end
