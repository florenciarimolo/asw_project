class SessionsController < ApplicationController
    def create
        #render text: request.env['omniauth.auth'].to_yaml
        redirect_to root_path
    end
end
