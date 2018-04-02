require 'ip2country/view_helpers'
module IP2COUNTRY
  class Railtie < Rails::Railtie
    initializer "ip2country.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end