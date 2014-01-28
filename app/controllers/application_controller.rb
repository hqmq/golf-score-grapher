class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def directory
    @directory ||= Directory.new(pg_connection)
  end

  def pg_connection
    @pg_connection ||= ActiveRecord::Base.connection
                        .instance_variable_get('@connection')
  end
end
