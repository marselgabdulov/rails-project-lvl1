# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class Input
    class SubmitInput < Base
      def to_html
        attrs = { type: 'submit', **@params }
        Tag.to_html('input', attrs)
      end
    end
  end
end
