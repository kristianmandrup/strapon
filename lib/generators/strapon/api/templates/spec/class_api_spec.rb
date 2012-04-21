require "spec_helper"

describe "/api/<%= class_name.underscore.pluralize %>", :type => :api do

  before do
    @<%= class_name.underscore %> = Factory.create(:<%= class_name.underscore %>)
  end

end
