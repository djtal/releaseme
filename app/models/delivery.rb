class Delivery < ActiveRecord::Base
  validates_presence_of :version_id
  validates_presence_of :application_id
  validates_uniqueness_of :application_id, :scope => :version_id
  
  belongs_to :version
  belongs_to :application
  
  scope :for_app, lambda{|app| where(:application_id => app.id)}
  
  
  state_machine :initial => :created do
    event :deliver do
      transition :created => :delivered
    end
    
    event :validate do
      transition :delivered => :validated
    end
    
    event :cancel do
      transition :delivered => :canceld
    end
  end
end
