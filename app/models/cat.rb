class Cat < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, maximum: 50
  belongs_to :event
  
  #scope :lottery, order: 'random()', limit: @quantity  
  scope :lottery, lambda{|quantity| order('random()').limit(quantity)}

end
