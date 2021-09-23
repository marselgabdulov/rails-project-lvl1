# frozen_string_literal: true

# module HexletCode
module HexletCode
  # module Tag
  module Tag
    def self.parse_attrs(attrs)
      attrs.inject(:merge).map do |key, value|
        "#{key}=\"#{value}\""
      end.join(' ')
    end

    def self.to_html(tag, *args)
      single_tags = %w[br img input]
      html = "<#{tag} #{parse_attrs(args)}>"
      return html if single_tags.include?(tag)

      if block_given?
        "<#{tag} #{parse_attrs(args)}>#{yield}</#{tag}>"
      else
        "<#{tag} #{parse_attrs(args)}></#{tag}>"
      end
    end
  end
end
