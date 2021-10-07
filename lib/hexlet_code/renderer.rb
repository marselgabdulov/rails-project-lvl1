# frozen_string_literal: true

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

    def input_init(type, params)
      type ||= :string
      Object.const_get("HexletCode::Inputs::#{type.capitalize}Input").new(params)
    end

    def render_label(name)
      Tag.to_html('label', { for: name }) { name.capitalize }
    end

    def render_inputs
      @form.inputs.each_with_object([]) do |input, result|
        type = input.delete(:type)
        result << render_label(input[:name]) if type != 'submit'
        result << input_init(type, input).to_html
      end.join
    end
  end
end
