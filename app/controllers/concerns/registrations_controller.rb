class RegistrationsController < Devise::RegistrationsController
  after_action :create_score, only: :create

  protected

  def create_score
    @score = Score.new(total: 0, user: current_user)
    @score.save
    puts "Saving score"
  end
end
