class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def directory
    @directory ||= Directory.new
  end
end
