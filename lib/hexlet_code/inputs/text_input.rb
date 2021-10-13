# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class TextArea
    class TextInput < Base
      def render
        attrs = { **@params }
        cols = attrs[:cols].to_s || '20'
        rows = attrs[:rows].to_s || '40'
        Tag.render('textarea', { cols: cols, rows: rows, name: attrs[:name] }) { attrs[:value] }
      end
    end
  end
end
