# frozen_string_literal: true

# module HexletCode
module HexletCode
  # class Input
  class Input
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def to_html
      attrs = { type: "text", **@params }
      Tag.to_html("input", attrs)
    end
  end
end
