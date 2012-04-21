module Strapon
  class Engine < Rails::Engine
    isolate_namespace Strapon
    
    config.generators.integration_tool    :rspec
    config.generators.test_framework      :rspec
  end
end
