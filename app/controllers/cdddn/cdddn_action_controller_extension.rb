module Cdddn::CdddnActionControllerExtension

  def self.included(base)
    base.before_filter :cdddn_set_format
  end

  def cdddn_set_format
    if request.format.html? && 'mobile' == cookies[:device]
      request.format = :mobile
    end
  end 
end