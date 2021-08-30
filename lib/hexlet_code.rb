# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"

# module HexletCode
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def self.form_for(_obj, url = nil)
    if url
      Tag.build("form", action: url[:url], method: "post")
    else
      Tag.build("form", action: "#", method: "post")
    end
  end
end
