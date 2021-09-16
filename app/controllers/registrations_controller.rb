class RegistrationsController < Devise::RegistrationsController

    private 

    def sign_up_params
        # params.require(:user).permit(:user_name, :first_name, :last_name, :password, :password_confirmation)
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
