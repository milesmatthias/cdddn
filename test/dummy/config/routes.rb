Rails.application.routes.draw do

  root :to => "root#index"

  mount Cdddn::Engine => "/cdddn"
end
