class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        render plain: User.all.map{|user| user.to_look_pleasant}.join("\n")
    end

    def create
        name=params[:name]
        email=params[:email]
        password=params[:password]
        new_user=User.create!(name: name,email: email, password: password)
        render plain: "A new user is created with the id #{new_user.id}"
    end 

    def  show
        id=params[:id]
        user=User.find(id) 
        render plain:"User with id #{id} : #{user.to_look_pleasant}"
    end 

    def login
        render plain: User.where(email: params[:email] ,password: params[:password]).exists?
    end
end