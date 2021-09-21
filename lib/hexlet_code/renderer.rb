# frozen_string_literal: true

require_relative 'inputs/input'
require_relative 'inputs/text_area'
require_relative 'inputs/select'

# module HexletCode
module HexletCode
  # class Renderer
  class Renderer
    attr_reader :form

    def initialize(form)
      @form = form
    end

    def run
      Tag.to_html('form', action: @form.action, method: 'post') { render_inputs }
    end

    private

    def input_class(type)
      case type
      when :text then 'TextArea'
      when nil then 'Input'
      else type.to_s.capitalize
      end
    end

    def input_init(type, params)
      class_name = input_class(type)
      Object.const_get("HexletCode::#{class_name}").new(params)
    end

    def render_inputs
      inputs = @form.inputs
      inputs.each_with_object([]) do |input, result|
        result << input_init(input[:input_type], input.except(:input_type)).to_html
      end.join
    end
  end
end
