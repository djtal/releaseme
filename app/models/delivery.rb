class Delivery < ActiveRecord::Base
  validates_presence_of :project_id
  validates_presence_of :environment_id
  
  belongs_to :project, :counter_cache => true
  belongs_to :environment
  
  
  state_machine :initial => :created do
    event :deliver do
      transition :created => :delivered
    end
    
    event :validate do
      transition :delivered => :validated
    end
  end
end
