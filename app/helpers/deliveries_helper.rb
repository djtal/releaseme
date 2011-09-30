module DeliveriesHelper
  def deliveries_state_for(delivery)
    content_tag(:span, delivery ? delivery.state : "N/A", :class => "label")
  end
  
  def delivery_transitions_form(delivery, event)
    simple_form_for(Delivery.new,
                        :url => transition_project_version_delivery_path(@project.id, @version.id, delivery.id, event)) do |f|
      f.button :submit, :value => event, :class => "btn primary"
    end
  end
end
