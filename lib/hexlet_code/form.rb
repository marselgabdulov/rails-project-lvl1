# frozen_string_literal: true

# module HexletCode
module HexletCode
  # class Form
  class Form
    attr_reader :inputs, :action, :attributes
    attr_accessor :submit_value

    def initialize(entity, url, attrs = nil)
      @entity = entity
      @action = url.nil? ? '#' : url[:url]
      @attributes = attrs
      @inputs = []
      @submit_value = nil
    end

    def input(name, **attrs)
      type = attrs[:as] || :string
      value = @entity[name]
      @inputs << { type: type, value: value, name: name, **attrs }
    end

    def submit(value = 'Save')
      @submit_value = value
    end
  end
end
