class StakesController < ApplicationController
  def show
    user_id = params[:user_id] # retrieve movie ID from URI route
    type = Users.find_by(user_id: user_id).type
    company_id = Users.find_by(user_id: user_id).company_id
    if type == "executive"
      @stakes = Stakes.where(company_id: company_id)
    elsif type == "employee"
      @stakes = Stakes.find_by(user_id: user_id)
    end
  end
end
