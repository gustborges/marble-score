class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @score = current_user.score if user_signed_in?
  end
end
