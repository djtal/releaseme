class Application < ActiveRecord::Base
  validates_presence_of :channel_id
  validates_presence_of :environment_id
  belongs_to :channel
  belongs_to :environment
  
  validates_uniqueness_of :environment_id
  
  acts_as_list :scope => :channel
end
