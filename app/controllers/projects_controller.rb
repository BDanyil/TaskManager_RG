# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.where(user_id: current_user.id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    set_project_title
    @project.user_id = current_user.id

    if @project.save
      redirect_to root_url
    else
      flash[:error] = @project.errors.to_a
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    find_project

    flash[:error] = @project.errors.to_a unless @project.destroy
    redirect_to root_url
  end

  def edit
    find_project
    render :edit
  end

  def update
    find_project
    set_project_title

    if @project.save
      redirect_to root_url
    else
      flash[:error] = @project.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end

  def set_project_title
    @project.title = project_params[:title]
  end
end
