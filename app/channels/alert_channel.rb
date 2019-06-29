class AlertChannel < ApplicationCable::Channel
  def subscribed  	
    stream_from "Alert"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
