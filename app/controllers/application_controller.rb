class ApplicationController < ActionController::Base
  before_action :log_activity_date
  include SessionsHelper
  
  private
  
    def log_activity_date
      if logged_in?
        log_activity_time
      end
    end
end
