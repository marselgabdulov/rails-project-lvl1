# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class Input
    class StringInput < Base
      def render
        attrs = { type: @params[:type] || 'text', **@params }
        Tag.render('input', attrs)
      end
    end
  end
end
