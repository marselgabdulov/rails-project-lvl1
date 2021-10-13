# frozen_string_literal: true

# module HexletCode
module HexletCode
  # class Renderer
  class Renderer
    attr_reader :form

    def initialize(form)
      @form = form
    end

    def render
      Tag.render('form', action: @form.action, method: 'post') { render_fields }
    end

    private

    def render_submit
      Tag.render('input', { type: 'submit', value: @form.submit_value, name: 'commit' })
    end

    def render_fields
      @form.inputs.each_with_object([]) do |input, result|
        type = input.delete(:type)
        result << Tag.render('label', { for: input[:name] }) { input[:name].capitalize }
        result << Object.const_get("HexletCode::Inputs::#{type.capitalize}Input").new(input).render
      end.join.concat(render_submit)
    end
  end
end
