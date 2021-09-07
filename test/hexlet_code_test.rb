# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @tag = HexletCode::Tag
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_form_for
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text, cols: 50, rows: 50
      f.input :gender, as: :select, collection: %w[m f]
      f.submit
    end
    assert_equal FormFixture.full_form, form
  end
end
