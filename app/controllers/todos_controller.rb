class TodosController < ApplicationController
    def index
        render plain: Todo.order(:due_date).map {|todo| todo.to_look_pleasant }.join("\n")
    end
end 