class Users::SessionsController < Devise::SessionsController
  def new
    @user = User.new
  end

  # def create
  #   super (親クラスのcreateアクションを参照)
  # end
end
