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

  def test_form_for
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.input :gender, as: :select, collection: %w[m f]
      f.submit
    end
    # rubocop:disable Layout/LineLength
    assert_equal '<form action="#" method="post"><label for="name">Name</label><input type="text" value="rob" name="name"><textarea cols="20" rows="40" name="job">hexlet</textarea><select name="gender"><option value="m" selected>m</option><option value="f">f</option></select><input type="submit" value="Save" name="commit"></form>', form
    # rubocop:enable Layout/LineLength
  end
end
