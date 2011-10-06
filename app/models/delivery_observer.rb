class DeliveryObserver < ActiveRecord::Observer
  
  def after_validate(delivery, transition)
      channel = delivery.version.channel
      next_app = channel.applications[delivery.application.position]
      return  unless next_app
      d = Delivery.new do |d|
        d.application = next_app
        d.version = delivery.version
      end
      d.save
  end
end
