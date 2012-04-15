class Users::SessionsController < Devise::SessionsController

	 layout nil

   def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    if resource.status == true
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => redirect_location(resource_name, resource)
    else
      sign_out
      redirect_to new_user_session_path
      flash[:notice]= "Your account is deactivated. please contact Administrator for further details."
    end
  end

end

