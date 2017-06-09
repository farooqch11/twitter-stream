Rails.application.routes.draw do
  Rails.application.routes.draw do
    root 'twitter_status#index'
  end

  get 'twitter_status/getstatus'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
