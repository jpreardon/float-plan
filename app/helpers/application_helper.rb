module ApplicationHelper
    
    # This is the application name, keeping it dynamic since it's likly to change. 2019-04-29 JPR
    def app_name
      return "Float Plan"
    end
    
    # Return the page title
    def full_title(page_title = '')
      if page_title.empty?
        app_name
      else
        page_title + ' | ' + app_name
      end
    end
end
