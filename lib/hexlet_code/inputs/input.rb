# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class Input
    class Input < BaseInput
      def to_html
        attrs = { type: @params[:type] || 'text', **@params }
        if attrs[:type] == 'text'
          Tag.to_html('input', attrs)
        else
          Tag.to_html('input', attrs)
        end
      end
    end
  end
end
