module Api
  class ProjectsController < Api::ApiController
    before_action :set_project, only: [:show, :update, :destroy]

    def index
      @projects = Project.all
    end

    def show; end
    
    def create
      @project = Project.new(project_params)

      if @project.save
        render :create, status: :created
      else
        render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @project.save
        render :update, status: :updated
      else
        render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy; end

    private

    def project_params
      params.require(:project).permit(:id, :name, projects_users_attributes: [:id, :user_id, :rate, :typeofrate, :currency, :_destroy])
    end

    def set_project
      @project = Project.find(params[:id])
    end
  end
end
