class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_look_pleasant }.join("\n")
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    render plain: "The new todo is created with id #{new_todo.id}"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_look_pleasant
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated Todo completed status to #{completed}"
  end
end
