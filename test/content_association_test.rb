require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class Article < ActiveRecord::Base
end

class ContentAssociationTest < Test::Unit::TestCase
  
  def test_article_can_has_flag
    Article.class_eval {
      can_be_flagged
    }
    assert_not_nil Article.reflect_on_association(:flags)
    assert_not_nil Article.reflect_on_association(:flaggable)
  end

end