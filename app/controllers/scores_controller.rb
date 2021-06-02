class ScoresController < ApplicationController
  before_action :score_find, only: %i[show edit update destroy]

  def index
    @scores = policy_scope(Score).all
  end

  def show; end

  def new
    @score = Score.new
    authorize @score
  end

  def edit; end

  def update
    if @score.update(score_params)
      redirect_to score_path(@score)
    else
      render :edit
    end
  end

  def destroy
    if @score.destroy
      redirect_to scores_path
    else
      render :show
    end
  end

  private

  def score_find
    @score = policy_scope(Score).find(params[:id])
    authorize @score
  end

  def score_params
    params.require(:score).permit(:total, :user_id, :description)
  end
end
