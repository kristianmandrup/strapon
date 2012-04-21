class <%= class_name.camelize.pluralize %>Controller < ApplicationController

  def index
  end


  def new
    @<%= class_name.underscore %> = <%= class_name.camelize.pluralize %>.new
  end

  def create
    <%= class_name.underscore %> = params[:<%= class_name.underscore %> ]

    else
      render :action => "new"
    end
  end

end
