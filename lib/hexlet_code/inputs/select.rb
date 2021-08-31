# frozen_string_literal: true

# module HexletCode
module HexletCode
  # class Select
  class Select
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def parse_collection(collection)
      collection.each_with_object([]) do |option, result|
        is_selected = collection.first == option
        result << Tag.to_html('option', { value: option, selected: is_selected }) { option }
      end.join
    end

    def to_html
      attrs = { type: 'text', **@params }
      Tag.to_html('select', { name: attrs[:name] }) { parse_collection(attrs[:collection]) }
    end
  end
end
