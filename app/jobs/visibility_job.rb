class VisibilityJob < ApplicationJob
  queue_as :default

  def perform(volunteer)
    volunteer.request.update_attributes(:visible => true)
  end
end
