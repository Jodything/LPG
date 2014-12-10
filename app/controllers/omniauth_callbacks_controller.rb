class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "You are now logged in"
      sign_in_and_redirect user
    else
      flash.notice = "Uh oh, something went wrong"
      session["devise.user_attributes"] = user.attributes
      redirect_to welcome_index_url
    end
  end

  alias_method :google_oauth2, :all
end
