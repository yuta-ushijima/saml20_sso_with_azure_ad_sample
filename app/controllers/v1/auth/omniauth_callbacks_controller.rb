# https://github.com/lynndylanhurley/devise_token_auth/blob/master/app/controllers/devise_token_auth/omniauth_callbacks_controller.rb
class V1::Auth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, raise: false
end