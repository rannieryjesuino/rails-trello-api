module Api::V1
 
#  Controlador "geral" da v1 da API, para nao misturar com o controlador geral da API (application_controller).
 class ApiController < ApplicationController
 
    acts_as_token_authentication_handler_for User

    before_action :require_authentication!
    
    private
    
        def require_authentication!
        
        throw(:warden, scope: :user) unless current_user.presence
        
        end
     
    end
 
end