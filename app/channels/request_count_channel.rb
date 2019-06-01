class RequestCountChannel < ApplicationCable::Channel
  def subscribed  	
    stream_from "RequestCount"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
