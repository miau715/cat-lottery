require 'test_helper'

class CatTest < ActiveSupport::TestCase
  fixtures  :cats
  test "cat name must not be empty" do
    cat = Cat.new
    assert cat.invalid?
    assert cat.errors[:name].any?
  end
  
  test "cat name should not be longer than 50" do
    cat = Cat.new(name: "OPAPI")
    cat.name = "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    assert cat.invalid?
    assert_equal "is too long (maximum is 50 characters)",
    cat.errors[:name].join('; ')
    cat.name = "OPAPI"
    assert cat.valid?
  end
end
