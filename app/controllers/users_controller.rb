class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      
      if user.save
        render json: { message: 'User created successfully', user: user }, status: :created
      else
        render json: { error: 'Failed to create user', details: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
  