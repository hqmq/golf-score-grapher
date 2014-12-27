class HomeController < ApplicationController
  def index
    render :file => Rails.root + "public/index.html", :layout => nil
  end
end
