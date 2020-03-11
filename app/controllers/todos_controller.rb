class TodosController < ApplicationController
    def index
        render plain: "I am cool"
        render plain: User.all
    end
end
