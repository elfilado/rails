class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def show
      @user = current_user
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def become_seller
      current_user.create_seller
      redirect_to user_path(current_user), notice: 'You are now a seller!'
    end
  
    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  