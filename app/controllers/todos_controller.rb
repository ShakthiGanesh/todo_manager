class TodosController < ApplicationController
    def index
        render plain: "Hello Rails! #{Time.now.to_s(:short)}"
    end
end