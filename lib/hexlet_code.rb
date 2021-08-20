# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  module Tag
    def self.parse_attrs(attrs)
      result = ""
      attrs.each do |a|
        a.each { |k, v| result += "#{k}=\"#{v}\" " }
      end
      result.rstrip
    end

    def self.build(name, *args)
      if block_given? && args.empty?
        "<#{name}>#{yield}</#{name}>"
      elsif block_given? && !args.empty?
        "<#{name} #{parse_attrs(args)}>#{yield}</#{name}>"
      elsif !block_given? && !args.empty?
        "<#{name} #{parse_attrs(args)}>"
      else
        "<#{name}>"
      end
    end
  end
end

tag = HexletCode::Tag.build("br")
puts tag