class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted? && ["aatcarriers.com", "ambition.com", "americanexchange.com", "chattanoogawhiskey.com",
                           "fanjam.com", "fancyrhino.com", "getbellhops.com","lamppostgroup.com",
                           "morningdoveservices.com", "noog.com", "pando.com", "pricewaiter.com", "readycart.com",
                           "reliancepartners.com", "steamlogistics.com","supplyhog.com", "wampstrategy.com",
                           "waypaver.co"].include?(user.company.downcase)

      flash.notice = "You are now logged in"
      sign_in_and_redirect user
    else
      flash.notice = "Uh oh, something went wrong"
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_path
    end
  end

  alias_method :google_oauth2, :all
end
