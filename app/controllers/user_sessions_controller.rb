class UserSessionsController < ApplicationController

  skip_before_action :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:iin], params[:password])
      role_selector = RoleSelector.new
      role_selector
        .on(:multirole) { redirect_to multirole_root_path }
        .on(:administrator) { redirect_to admin_root_path }
        .on(:student) { redirect_to student_root_path }
        .on(:custodian) { redirect_to custodian_root_path }
        .on(:none) { redirect_to no_role_root_path }
      role_selector.call(@user.roles)
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end