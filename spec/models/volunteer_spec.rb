require 'rails_helper'

RSpec.describe Volunteer, type: :model do
	
  	context 'after 5 volunteers' do  	        
	  	it 'request is not visible and VisibilityJob is added to queue' do
	  		ActiveJob::Base.queue_adapter = :test	        
	        vol1 = Volunteer.create!(request_id: 1, user_id: 2)
	        vol2 = Volunteer.create!(request_id: 1, user_id: 3)
	        vol3 = Volunteer.create!(request_id: 1, user_id: 4)
	        vol4 = Volunteer.create!(request_id: 1, user_id: 5)
	        vol5 = Volunteer.create!(request_id: 1, user_id: 6)
	        expect(vol5.request).to have_attributes(:visible => false)
	        expect(VisibilityJob).to have_been_enqueued
	    end
	end
end
