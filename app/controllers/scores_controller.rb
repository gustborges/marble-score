class ScoresController < ApplicationController
  before_action :score_find, only: %i[show edit update destroy]

  def index
    @scores = policy_scope(Score).all
  end

  def show
    case @score.total
    when 0
      @score.description = "you don't have a score yet"
      @score_color = "3b3b3b"
    when 1..60
      @score.description = "your score is too low. You should study more on this subject. If you need any help, contact your teacher and ask for some help. In the beginning of your studies, it's totally normal to have low scores. Don't give up! Keep moving!"
      @score_color = "#e13d3d"
    when 60..80
      @score.description = "you have a good score but we can think of some improvements. Your teacher will be able to help you through the hardest subjects. Anyway, you are on the right path. Keep moving!"
      @score_color = "#f2ea04"
    when 80..100
      @score.description = "you have a fantastic score, which is higher than the average. That means you have probably studied a lot. We are very proud. Congratulations!"
      @score_color = "#14c75e"
    end
  end

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
