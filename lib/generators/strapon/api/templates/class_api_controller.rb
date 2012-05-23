class Api::<%= class_name.camelize %>Controller < ApplicationController

  respond_to :json, :html
  before_filter :find_<%= class_name.underscore %>, :only => [:update, :show]

  def create    
  end

  def update    
    @<%= class_name.underscore %>.update_attributes(<%= class_name.underscore %>_params)
  end

  def show
  end

  protected

  def <%= class_name.underscore %>_params
    params[:<%= class_name.underscore %>]
  end

  def find_<%= class_name.underscore %>
  end

  def remove_inaccessible_attributes_from_params
    params[:<%= class_name.underscore %>].try(:slice!, *<%= class_name.camelize %>::API.accessible_attributes)
  end


  def limit_authorize_attributes_from_params
    params[:<%= class_name.underscore %>].try(:slice!, *<%= class_name.camelize %>::API.authorize_attributes)
  end

end
