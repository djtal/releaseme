class Project < ActiveRecord::Base
  has_many :versions, :dependent => :restrict
end
