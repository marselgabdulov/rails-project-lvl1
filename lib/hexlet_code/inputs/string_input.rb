# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class Input
    class StringInput < Base
      def to_html
        attrs = { type: @params[:type] || 'text', **@params }
        Tag.to_html('input', attrs)
      end
    end
  end
end
