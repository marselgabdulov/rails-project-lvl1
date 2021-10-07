# frozen_string_literal: true

# module HexletCode
module HexletCode
  autoload :Inputs, 'hexlet_code/inputs.rb'
  autoload :Form, 'hexlet_code/form.rb'
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Renderer, 'hexlet_code/renderer.rb'
  autoload :VERSION, 'hexlet_code/version.rb'

  def self.form_for(entity, url = nil, **inputs)
    form = Form.new(entity, url, **inputs)
    yield form
    Renderer.new(form).run
  end
end
