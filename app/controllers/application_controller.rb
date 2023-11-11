class ApplicationController < ActionController::Base
  before_action :configure_user_permitted_parameters, if: :devise_controller?
  before_action :configure_camp_site_permitted_parameters, if: :devise_controller?


  protected
    # def after_sign_in_path_for(resource)
    #   if user_signed_in?
    #     root_path
    #   else
    #     camp_site_users_index_path
    #   end
    # end

    def after_sign_in_path_for(resource)
      if resource.is_a?(User)
        flash[:notice] = 'ログインしてください。予約はログイン後に行えます。'
        root_path
      else
        camp_site_users_path
      end
    end

    def configure_user_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number])
    end
    
    def configure_camp_site_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :post_code, :address, :phone_number, :email])
    end

end
