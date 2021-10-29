ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :username, :email, :password, :password_confirmation, :real_name, :is_admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :email, :password_digest, :real_name, :is_admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do 
    resources_configuration[:self][:finder] = :find_by_username
  end 
  
end
