class Version < ActiveRecord::Base
  validates_presence_of :channel_id, :project_id
  belongs_to :project
  belongs_to :channel
  has_many :deliveries, :dependent => :destroy
  
  scope :for_channel,  lambda{|channel| where(:channel_id => channel.id) }
end
