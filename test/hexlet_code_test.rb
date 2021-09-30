# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: "rob", job: "hexlet", gender: "m"
    @form_fixture = File.new("./test/fixtures/form_fixture.html").read.tr("\n","")
  end

  def test_form_for
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text, cols: 50, rows: 50
      f.input :gender, as: :select, collection: %w[m f]
      f.submit
    end
    assert_equal @form_fixture, form
  end
end
