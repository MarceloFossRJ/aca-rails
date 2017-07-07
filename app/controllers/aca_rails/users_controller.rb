require_dependency "aca_rails/application_controller"

module AcaRails
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    def index
      # @users = User.all
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).page params[:page]
    end

    # GET /users/1
    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to users_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        redirect_to users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    def versions
      @versions = UserVersion.all.order('created_at desc').page params[:page]
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:name, :login, :email, :password_digest, :is_admin, :is_active, :last_login, :last_ip, :login_attempts)
      end

      def sort_column
        User.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end

    end
end
