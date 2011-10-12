class Delivery < ActiveRecord::Base
  validates_presence_of :version_id
  validates_presence_of :application_id
  validates_uniqueness_of :application_id, :scope => :version_id
  
  belongs_to :version
  belongs_to :application
  has_one :environment, :through => :application
  
  scope :for_app, lambda{|app| where(:application_id => app.id)}
  
  
  state_machine :initial => :created do
    
    event :ask_deliver do
      transition :created => :asked, :if => :environment_asked?
    end
    
    event :deliver do
      transition :created  => :delivered, :if => :previous_delivery_validated?, :unless => :environment_asked?
      transition :asked => :delivered, :if => :environment_asked?
    end
    
    event :validate do
      transition :delivered => :validated
    end
    
    event :cancel do
      transition :delivered => :canceld
    end
  end
  
  
  def previous_delivery_validated?
    return true if self.application.first?
    prev = self.class.for_app(self.application.higher_item).where(:version_id => self.version_id).first
    return prev ? prev.validated? : false
  end
  
  def environment_asked?
    self.environment.ask_deliver
  end
end
