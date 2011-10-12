class Environment < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_one :application, :dependent => :restrict
end
