class HomeController < ApplicationController
  def index
    render :file => Rails.root + "db/index.html", :layout => nil
  end
end
