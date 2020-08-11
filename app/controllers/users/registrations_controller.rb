class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :f_name_kana, :l_name_kana, :birthday)
    end
end
