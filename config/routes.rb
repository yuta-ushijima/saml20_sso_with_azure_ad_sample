Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks: "v1/auth/omniauth_callbacks",
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
