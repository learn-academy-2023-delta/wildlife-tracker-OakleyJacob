class ApplicationController < ActionController::API
    skip_before_action :verify_authenticity_token, raise: false

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def render_unprocessable_entity_response(exception)
        p 'we made it into app'
        render json: exception.record.errors, status: 422
      end 
     
end
