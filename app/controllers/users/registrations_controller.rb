class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_user!


  layout nil

## overwrite super method to get signup form when administrator logs in.
  def require_no_authentication
  end


end
