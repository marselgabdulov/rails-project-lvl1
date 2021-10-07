# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class TextArea
    class TextInput < Base
      def to_html
        attrs = { **@params }
        # rubocop: disable Layout/LineLength
        Tag.to_html('textarea', { cols: attrs[:cols].to_s || '20', rows: attrs[:rows].to_s || '40', name: attrs[:name] }) { attrs[:value] }
        # rubocop: enable Layout/LineLength
      end
    end
  end
end
