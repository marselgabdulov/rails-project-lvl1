# frozen_string_literal: true

require_relative 'base_input'

# module HexletCode
module HexletCode
  # class Input
  class Input < BaseInput
    def to_html
      attrs = { type: @params[:type] || 'text', **@params }
      if attrs[:type] == 'text'
        [
          Tag.to_html('label', { for: attrs[:name] }) { attrs[:name].capitalize },
          Tag.to_html('input', attrs)
        ].join
      else
        Tag.to_html('input', attrs)
      end
    end
  end
end
