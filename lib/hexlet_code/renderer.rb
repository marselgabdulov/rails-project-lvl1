# frozen_string_literal: true

require_relative "inputs/input"
require_relative "inputs/text_area"
require_relative "inputs/select"

# module HexletCode
module HexletCode
  # class Renderer
  class Renderer
    attr_reader :form

    def initialize(form)
      @form = form
    end

    def input_init(type, params)
      case type
      when :text
        TextArea.new(params)
      when :select
        Select.new(params)
      else
        Input.new(params)
      end
    end

    def render_inputs
      inputs = @form.state[:inputs]
      inputs.each_with_object([]) do |input, result|
        result << input_init(input[:input_type], input.except(:input_type)).to_html
      end.join
    end

    def run
      Tag.to_html('form', action: @form.state[:action], method: 'post') { render_inputs }
    end
  end
end
