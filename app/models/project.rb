class Project < ActiveRecord::Base
  has_many :deliveries
  has_many :versions
end
