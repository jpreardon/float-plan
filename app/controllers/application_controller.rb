class ApplicationController < ActionController::Base
  
  def hello
    render html: "hello, nasty"
  end
end
