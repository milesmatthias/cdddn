class RootController < ApplicationController

  def index
    Rails.logger.info('request format == ' + request.format.to_s)
  end

end