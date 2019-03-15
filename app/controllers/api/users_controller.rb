module Api
  class UsersController < Api::ApiController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
    end

    def show; end
    
    def create
      @user = User.new(user_params)

      if @user.save
        render :create, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render :update, status: :updated
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
    end

    private

    def user_params
      params.require(:user).permit(
        :id,
        :name,
        :alias,
        projects_users_attributes: [
          :id,
          :project_id,
          :rate,
          :typeofrate,
          :currency,
          :_destroy
        ]
      )
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
