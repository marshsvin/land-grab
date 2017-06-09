Rails.application.routes.draw do

root to: "properties#index"

  # Routes for the Property_use resource:
  # CREATE
  get "/property_uses/new", :controller => "property_uses", :action => "new"
  post "/create_property_use", :controller => "property_uses", :action => "create"

  # READ
  get "/property_uses", :controller => "property_uses", :action => "index"
  get "/property_uses/:id", :controller => "property_uses", :action => "show"

  # UPDATE
  get "/property_uses/:id/edit", :controller => "property_uses", :action => "edit"
  post "/update_property_use/:id", :controller => "property_uses", :action => "update"

  # DELETE
  get "/delete_property_use/:id", :controller => "property_uses", :action => "destroy"
  #------------------------------

  # Routes for the Activity resource:
  # CREATE
  get "/activities/new", :controller => "activities", :action => "new"
  post "/create_activity", :controller => "activities", :action => "create"

  # READ
  get "/activities", :controller => "activities", :action => "index"
  get "/activities/:id", :controller => "activities", :action => "show"

  # UPDATE
  get "/activities/:id/edit", :controller => "activities", :action => "edit"
  post "/update_activity/:id", :controller => "activities", :action => "update"

  # DELETE
  get "/delete_activity/:id", :controller => "activities", :action => "destroy"
  #------------------------------

  # Routes for the Picture resource:
  # CREATE
  get "/pictures/new", :controller => "pictures", :action => "new"
  post "/create_picture", :controller => "pictures", :action => "create"

  # READ
  get "/pictures", :controller => "pictures", :action => "index"
  get "/pictures/:id", :controller => "pictures", :action => "show"
  #get "/pictures/property_pics/:id", :controller => "pictures", :action => "property_pics"

  # UPDATE
  get "/pictures/:id/edit", :controller => "pictures", :action => "edit"
  post "/update_picture/:id", :controller => "pictures", :action => "update"

  # DELETE
  get "/delete_picture/:id", :controller => "pictures", :action => "destroy"
  #------------------------------

  # Routes for the Request resource:
  # CREATE
  get "/requests/new", :controller => "requests", :action => "new"
  post "/create_request", :controller => "requests", :action => "create"

  # READ
  get "/requests", :controller => "requests", :action => "index"
  get "/requests/:id", :controller => "requests", :action => "show"
  get "/my_requests", :controller => "requests", :action => "my_requests"

  # UPDATE
  get "/requests/:id/edit", :controller => "requests", :action => "edit"
  post "/update_request/:id", :controller => "requests", :action => "update"

  # DELETE
  get "/delete_request/:id", :controller => "requests", :action => "destroy"
  #------------------------------

  # Routes for the Property_review resource:
  # CREATE
  get "/property_reviews/new", :controller => "property_reviews", :action => "new"
  post "/create_property_review", :controller => "property_reviews", :action => "create"

  # READ
  get "/property_reviews", :controller => "property_reviews", :action => "index"
  get "/property_reviews/:id", :controller => "property_reviews", :action => "show"

  # UPDATE
  get "/property_reviews/:id/edit", :controller => "property_reviews", :action => "edit"
  post "/update_property_review/:id", :controller => "property_reviews", :action => "update"

  # DELETE
  get "/delete_property_review/:id", :controller => "property_reviews", :action => "destroy"
  #------------------------------

  # Routes for the Property resource:
  # CREATE
  get "/properties/new", :controller => "properties", :action => "new"
  post "/create_property", :controller => "properties", :action => "create"

  # READ
  get "/properties", :controller => "properties", :action => "index"
  get "/properties/:id", :controller => "properties", :action => "show"
  get "/my_properties", :controller => "properties", :action => "my_properties"

  # UPDATE
  get "/properties/:id/edit", :controller => "properties", :action => "edit"
  post "/update_property/:id", :controller => "properties", :action => "update"

  # DELETE
  get "/delete_property/:id", :controller => "properties", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
