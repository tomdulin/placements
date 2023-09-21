class RegistrationsController < Devise::RegistrationsController
    # POST /resource
    def update
      super
    end

    def create
      super
    end

    protected

    def after_sign_up_path_for(resource)
      invoices_path
    end

    def after_update_path_for(resource)
      invoices_path
    end

    private
    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end