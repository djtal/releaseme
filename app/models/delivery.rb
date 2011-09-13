class Delivery < ActiveRecord::Base
  state_machine :initial => :created do
    event :deliver do
      transition :created => :delivered
    end
    
    event :validate do
      transition :delivered => :validated
    end
  end
end
