# frozen_string_literal: true

# module HexletCode
module HexletCode
  # class TextArea
  class TextArea
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def to_html # rubocop:disable Layout/LineLength
      attrs = { **@params }
      [
        Tag.to_html("label", { for: attrs[:name] }) { attrs[:name].capitalize },
        Tag.to_html("textarea", { cols: attrs[:cols].to_s || "20", rows: attrs[:rows].to_s || "40", name: attrs[:name] }) { attrs[:value] }
      ].join
    end
  end
end
