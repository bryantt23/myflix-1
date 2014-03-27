class ForgotPasswordsController < ApplicationController
    def create
      user = User.where(email: params[:email]).first
      if user
        AppMailer.send_forgot_password(user).deliver
        redirect_to :forgot_password_confirmation
      else
        flash[:error] = params[:email].blank? ? "Email can not be blank" : "We can not find that email."
        redirect_to :forgot_password
      end
    end
    
end