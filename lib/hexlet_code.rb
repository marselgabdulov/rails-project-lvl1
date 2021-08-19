# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  class Tag
    attr_accessor :result

    def initialize(tag = '')
      @tag = tag
    end

    def parse_attrs(attrs)
      result = ''
      attrs.each do |a|
        a.each { |k, v| result += "#{k}=\"#{v}\" " }
      end
      result.rstrip
    end

    def build(tag_name, *args)
      if !args.empty?
        @result = "<#{tag_name} #{parse_attrs(args)}>"
      else
        @result = "<#{tag_name}>"
      end
    end
  end
end

tag = HexletCode::Tag.new()

