class ApplicationController < ActionController::Base
  
  def hello
    render html: "hello, nasty II"
  end
end
