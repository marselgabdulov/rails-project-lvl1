# frozen_string_literal: true

# module HexletCode
module HexletCode
  # module Tag
  module Tag
    def self.build_options(options)
      options.inject(:merge).map do |key, value|
        " #{key}=\"#{value}\""
      end.join
    end

    def self.render(tag, *options)
      single_tags = %w[br img input]
      html = "<#{tag}#{build_options(options)}>"
      return html if single_tags.include?(tag)

      if block_given?
        "<#{tag}#{build_options(options)}>#{yield}</#{tag}>"
      else
        "<#{tag}#{build_options(options)}></#{tag}>"
      end
    end
  end
end
