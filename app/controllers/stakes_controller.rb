
class StakesController < ApplicationController
  def show
    user_id = params[:user_id] # retrieve movie ID from URI route
    type = User.find_by(id: user_id).role
    company_id = User.find_by(id: user_id).company_id
    if type == "Executive"
      # puts Stake.where(c_id: company_id)
      @stakes = Stake.where(c_id: company_id)
    elsif type == "Employee"
      # puts Stake.where(u_id: user_id)
      @stakes = Stake.where(u_id: User.find_by(id: user_id).name)
    end
  end
end
