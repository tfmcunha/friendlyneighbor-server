class RequestsChannel < ApplicationCable::Channel
  def subscribed  	
    stream_from "Request_#{params[:request]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
