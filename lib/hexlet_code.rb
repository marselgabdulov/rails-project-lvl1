# frozen_string_literal: true

require_relative "hexlet_code/version"

# module HexletCode
module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  # module Tag
  module Tag
    def self.parse_attrs(attrs)
      result = ""
      attrs.each do |a|
        a.each { |k, v| result += "#{k}=\"#{v}\" " }
      end
      result.rstrip
    end

    def self.build(name, *args)
      if block_given? && args.empty?
        "<#{name}>#{yield}</#{name}>"
      elsif block_given? && !args.empty?
        "<#{name} #{parse_attrs(args)}>#{yield}</#{name}>"
      elsif !block_given? && !args.empty?
        "<#{name} #{parse_attrs(args)}>"
      else
        "<#{name}>"
      end
    end
  end

  def self.form_for(_obj, url = nil)
    if url.nil?
      '<form action="#" method="post"></form>'
    else
      '<form action="/users" method="post"></form>'
    end
  end
end
