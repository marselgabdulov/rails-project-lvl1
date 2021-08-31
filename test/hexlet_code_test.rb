# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @tag = HexletCode::Tag
    @user = User.new name: "rob", job: "hexlet", gender: "m"
  end

  def test_simple_tag
    assert_equal "<br>", @tag.to_html("br")
  end

  def test_complex_tag
    assert_equal '<input type="submit" value="Save">', @tag.to_html("input", type: "submit", value: "Save")
  end

  def test_simple_paired_tag
    assert_equal "<p>Hello</p>", @tag.to_html("p") { "Hello" }
  end

  def test_complex_paired_tag
    assert_equal '<label for="email">Email</label>', @tag.to_html("label", for: "email") { "Email" }
  end

  def test_form_for
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.input :gender, as: :select, collection: %w[m f]
    end
    # rubocop:disable Layout/LineLength
    assert_equal '<form action="#" method="post"><input type="text" value="rob" name="name"><textarea cols="20" rows="40" name="job">hexlet</textarea><select name="gender"><option value="m" selected>m</option><option value="f">f</option></select></form>', form
    # rubocop:enable Layout/LineLength
  end
end
