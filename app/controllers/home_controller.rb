class HomeController < ApplicationController
  def index
    @secrets = Rails.application.credentials[:myapp] || {}
  end
end
