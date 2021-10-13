# frozen_string_literal: true

# module HexletCode
module HexletCode
  module Inputs
    # class Select
    class SelectInput < Base
      def parse_collection(collection)
        collection.each_with_object([]) do |option, result|
          is_selected = collection.first == option
          result << Tag.render('option', { value: option, selected: is_selected }) { option }
        end.join
      end

      def render
        attrs = { type: 'text', **@params }
        Tag.render('select', { name: attrs[:name] }) { parse_collection(attrs[:collection]) }
      end
    end
  end
end
