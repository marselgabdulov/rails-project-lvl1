# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/form"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/renderer"

# module HexletCode
module HexletCode
  def self.form_for(entity, url = nil, **inputs)
    form = Form.new(entity, url, **inputs)
    yield form
    Renderer.new(form).run
  end
end
