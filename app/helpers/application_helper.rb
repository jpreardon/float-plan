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
  
  # change the default link renderer for will_paginate
  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => WillPaginate::ActionView::Bootstrap4LinkRenderer
    end
    super *[collection_or_options, options].compact
  end
  
  # Date and time format helpers, to keep things consistent 2019-05-26 JPR
  
  # These are used (mostly) to enter default values in forms
  def format_date_html(date)
    return date.strftime('%Y-%m-%d')
  end
  
  def format_time_html(time)
    return time.strftime('%H:%M') 
  end
  
  # These are used to display dates/times to users
  def format_date_human(date)
    return date.strftime('%m/%d/%Y')
  end
  
  def format_time_human(time)
    return time.strftime('%l:%M %p')
  end
  
end