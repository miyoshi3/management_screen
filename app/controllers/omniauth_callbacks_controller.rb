class OmniauthCallbacksController < ApplicationController
  def twitter
      @user = User.from_omniauth(request.env["omniiauth.auth"].except("extra"))
      if @user.persisted?
         sign_in_and_redirect @user
      else
         session["devise.user_attributes"] = @user.attributes
         redirect_to new_registration_url
      end
  end     
end
