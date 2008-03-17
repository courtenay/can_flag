require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

class UserAssociationTest < Test::Unit::TestCase
  
  def test_craetes_user_association_in_flag
    assert_nil Flag.reflect_on_association(:user)
    User.class_eval do
      can_flag
    end
    assert_not_nil Flag.reflect_on_association(:user)
  end
  
  def test_creates_flaggable_associations_in_user
    assert_nil User.reflect_on_association(:flaggable)
    User.class_eval do 
      can_flag
    end
    assert_not_nil User.reflect_on_association(:flagged)
    assert_equal :has_many, User.reflect_on_association(:flagged).macro
    assert_not_nil User.reflect_on_association(:flags)
    assert_equal :has_many, User.reflect_on_association(:flags).macro
  end
  
end