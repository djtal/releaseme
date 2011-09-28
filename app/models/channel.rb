class Channel < ActiveRecord::Base
  validates_uniqueness_of :name
  
  has_many :applications, :order => :position
end
