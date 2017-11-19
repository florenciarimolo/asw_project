class PagesController < ApplicationController
    def index
        if current_user
            redirect_to issues_url
        end
    end
end
