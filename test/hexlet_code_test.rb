# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @tag = HexletCode::Tag
  end

  def test_simple_tag
    assert_equal "<br>", @tag.build("br")
  end

  def test_complex_tag
    assert_equal '<input type="submit" value="Save">', @tag.build("input", type: "submit", value: "Save")
  end

  def test_simple_paired_tag
    assert_equal "<p>Hello</p>", @tag.build("p") { "Hello" }
  end

  def test_complex_paired_tag
    assert_equal '<label for="email">Email</label>', @tag.build("label", for: "email") { "Email" }
  end
end
