# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  class Tag
    attr_accessor :tag_name

    def initialize(tag = '')
      @tag = tag
    end

    def build(tag_name, *args)
      @tag_name = "<#{tag_name}>"
    end
  end
end

tag = HexletCode::Tag.new()
tag.build('br')
puts tag.tag_name
