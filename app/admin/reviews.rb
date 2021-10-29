ActiveAdmin.register Review do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :score, :restaurant, :price, :cuisine, :phone_number, :ambiance, :address, :latitude, :longitude, :user_id, :photo, :is_featured
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :score, :restaurant, :price, :cuisine, :phone_number, :ambiance, :address, :latitude, :longitude, :user_id, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
