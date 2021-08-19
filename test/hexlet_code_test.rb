# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @tag = HexletCode::Tag.new()
  end

  def test_simple_tag
    @tag.build('br')
    assert_equal '<br>', @tag.tag_name
  end

end
