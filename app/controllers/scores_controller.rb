class ScoresController < ApplicationController
  before_action :score_find, only: %i[show edit update destroy]

  def index
    @scores = policy_scope(Score).all
  end

  def show
    case @score.total
    when 0
      @score.description = "you don't have a score yet. Have you started your course? If you did and your score is not updated, please send us a note and we will fix it for you."
      @score_color = "gray"
    when 1..50
      @score.description = "unfortunately your score is too low. We advise you to study this subject a bit more. If you need any help, contact your teacher. In the beginning of your studies it's totally normal to have low scores. Don't give up! Keep moving!"
      @score_color = "#e13d3d"
    when 51..75
      @score.description = "you are on the right path. Keep moving! Your score is good, but there is always something to improve, don't you think? If you have any questions, your teacher will be able to help you."
      @score_color = "#efb104"
    when 76..100
      @score.description = "you have a fantastic score, which is higher than the average. That means you have probably studied a lot. We are very proud. Congratulations!"
      @score_color = "#14c75e"
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@score.user.name} Score", template: 'scores/score_pdf.html.erb', page_size: "A4",
               layout: 'pdf', ecoding: 'UTF-8'
      end
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
