require 'rails_helper'

RSpec.describe "Volunteers", type: :request do
	context 'on post to /volunteers' do
		let(:valid_params) do
        	{ request_id: 1, user_id: 2 }        
      	end

		it 'is denied without token' do			
			#headers = { "CONTENT_TYPE" => "application/json" }
			post "/volunteers", params: valid_params
			expect(response).to have_http_status(:unauthorized)
		end


	end  
end
