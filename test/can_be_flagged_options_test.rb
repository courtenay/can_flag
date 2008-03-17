require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class Article < ActiveRecord::Base
end

class CanBeFlaggedOptionsTest < Test::Unit::TestCase

  def test_sets_options_as_class_var
    Article.class_eval do
      can_be_flagged :reasons => [:porn, :troll]
    end

    assert_equal [:porn, :troll], Article.reasons
  end

end