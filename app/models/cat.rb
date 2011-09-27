class Cat < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, maximum: 50
end
