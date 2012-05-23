require "spec_helper"

describe "/api/<%= class_name.underscore.pluralize %>", :type => :api do
  let(:<%= class_name.underscore) { create :<%= class_name.underscore %> }
end
