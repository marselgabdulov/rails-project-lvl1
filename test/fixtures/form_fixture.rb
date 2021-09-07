# frozen_string_literal: true

# module FormFixture
module FormFixture
  def self.full_form
    '<form action="#" method="post"><label for="name">Name</label><input type="text" value="rob" name="name"><label for="job">Job</label><textarea cols="50" rows="50" name="job">hexlet</textarea><select name="gender"><option value="m" selected>m</option><option value="f">f</option></select><input type="submit" value="Save" name="commit"></form>'
  end
end