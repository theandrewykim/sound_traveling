class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_action :authenticate_user!

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "You've signed in"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
    alias_method :twitter, :all
end
