class UsersController < ApplicationController
  def show
      @user = current_user

      if !user_signed_in?
          redirect_to welcome_index_path
      end 
  end
end
