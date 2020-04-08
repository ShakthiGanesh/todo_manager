class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #render plain: Todo.order(:due_date).map { |todo| todo.to_look_pleasant }.join("\n")
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    redirect_to todos_path
  end

  def show
    #id = params[:id]
    #todo = Todo.find(id)
    #render plain: todo.to_look_pleasant
    render "todo"
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end
end
