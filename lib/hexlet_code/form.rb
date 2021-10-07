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

    def input(name, **attrs)
      type = attrs[:as] || :string
      value = @entity[name]
      @inputs << { type: type, value: value, name: name, **attrs }
    end

    def submit(value = 'Save')
      @inputs << { type: 'submit', value: value, name: 'commit' }
    end
  end
end
