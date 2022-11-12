
class StakesController < ApplicationController
  def show
    user_id = params[:user_id] # retrieve movie ID from URI route
    authenticate_user(user_id)
    type = User.find_by(id: user_id).role
    company_id = User.find_by(id: user_id).company_id
    if type == "Executive"
      # puts Stake.where(c_id: company_id)
      @stakes = Stake.where(c_id: company_id)
    elsif type == "Employee"
      # puts Stake.where(u_id: user_id)
      @stakes = Stake.where(u_id: user_id)
    end
    response.headers["Cache-Control"] = "no-cache, no-store"
  end

  def authenticate_user(user_id)
    print("auth")
    print(session["user_id"])
    print(user_id)
    if user_id != session["user_id"].to_s
      session.delete("user_id")
      flash[:notice] = "Unauthorized access. Please login."
      response.headers["Cache-Control"] = "no-cache, no-store"
      redirect_to sign_up_path
    end
  end
end
