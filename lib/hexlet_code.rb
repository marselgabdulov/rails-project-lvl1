# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  class Tag
    attr_accessor :tag_string

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
      @tag_string = "<#{tag_name}>#{yield}</#{tag_name}>" if block_given? && args.empty?
      @tag_string = "<#{tag_name} #{parse_attrs(args)}>#{yield}</#{tag_name}>" if block_given? && !args.empty?
      @tag_string = "<#{tag_name} #{parse_attrs(args)}>" if !block_given? && !args.empty?
      @tag_string = "<#{tag_name}>" if !block_given? && args.empty?
    end
  end
end

tag = HexletCode::Tag.new()

