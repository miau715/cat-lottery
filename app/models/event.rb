class Event < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  
  has_many :cats
  has_many :prizes
  belongs_to :user
  
  scope :lottery, lambda{|quantity| order('random()').limit(quantity)}
  
end
