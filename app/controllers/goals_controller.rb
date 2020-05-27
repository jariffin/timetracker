class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def show
    @goal  = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path
    else
      render:new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :description, :deadline)
  end

end
