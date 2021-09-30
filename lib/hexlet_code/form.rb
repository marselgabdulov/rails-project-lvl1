# frozen_string_literal: true

# module HexletCode
module HexletCode
  # class Form
  class Form
    attr_reader :inputs, :action, :attributes

    def initialize(entity, url, attrs = nil)
      @entity = entity
      @action = url.nil? ? '#' : url[:url]
      @attributes = attrs
      @inputs = []
    end

    def input(input_name, **attrs)
      input_type = attrs[:as] || 'input'
      value = @entity[input_name]
      @inputs << { input_type: input_type, value: value, name: input_name, **attrs }
    end

    def submit(value = 'Save')
      @inputs << { type: 'submit', value: value, name: 'commit' }
    end
  end
end
