Rails.application.routes.draw do

  get '/get' => 'requests#get'

  get '/yelp/search' => 'yelp#search'

end
