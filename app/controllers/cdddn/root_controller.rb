module Cdddn
  class RootController < Cdddn::ApplicationController
    def get
      render "get.html.erb", :layout => false
    end

    def set
      render "set.html.erb", :layout => false
    end
  end
end
