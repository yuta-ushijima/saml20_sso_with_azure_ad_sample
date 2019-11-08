class HomeController < ApplicationController
  def index
    render plain: "SSO is successfully!"
  end
end
