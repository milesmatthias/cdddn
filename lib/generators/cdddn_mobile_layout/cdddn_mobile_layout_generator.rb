class CdddnMobileLayoutGenerator < Rails::Generators::Base
  desc "This generator gives you a starting point for a mobile layout that uses CDDDN."

  source_root File.expand_path("../templates", __FILE__)

  def copy_mobile_layout_file
      copy_file "application.mobile.erb", "app/views/layouts/application.mobile.erb"
  end
end
