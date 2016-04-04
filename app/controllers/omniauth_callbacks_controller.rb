class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"]).to_yaml
  end
    alias_method :twitter, :all
end
