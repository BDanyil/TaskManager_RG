# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    new_task
  end

  def create
    new_task
    set_task_title

    if @task.save
      redirect_to root_url
    else
      flash[:error] = @task.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    find_task
    render :edit
  end

  def update
    find_task
    set_task_title
    @task.deadline = task_params[:deadline]

    if @task.save
      redirect_to root_url
    else
      flash[:error] = @task.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    find_task

    flash[:error] = @task.errors.full_messages unless @task.destroy
    redirect_to root_url
  end

  def priority_down
    find_task

    if @task.valid?
      @task.move_lower
      redirect_to root_url
    else
      flash[:error] = @task.errors.full_messages
    end
  end

  def priority_up
    find_task

    if @task.valid?
      @task.move_higher
      redirect_to root_url
    else
      flash[:error] = @task.errors.full_messages
    end
  end

  def complete
    find_task

    if @task.update(completed: task_params[:completed])
      head :ok
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed, :deadline)
  end

  def set_task_title
    @task.title = task_params[:title]
  end

  def find_task
    @task = current_user.tasks.find(params[:id])
  end

  def new_task
    @task = current_user.projects.find(params[:project_id]).tasks.new
  end
end
