class Project < ActiveRecord::Base
  validates_presence_of :name, :short_description
  has_many :versions, :dependent => :restrict
end
