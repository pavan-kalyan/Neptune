
class StakesController < ApplicationController
  def show
    flash[:message]=""
    user_id = params[:user_id] # retrieve movie ID from URI route
    @user_id = user_id
    @user_name = User.get_user_name_by_id(user_id)
    authenticate_user(user_id)
    type = User.find_by(id: user_id).role
    @role = type
    @plan = User.find_by(id: user_id).plan
    company_id = User.find_by(id: user_id).company_id
    @company_name = Company.get_company_name_by_id(company_id)
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
      redirect_to sign_in_path
    end
  end

  def edit
    user_id = params[:user_id]
    employee_id = params[:employee_id]
    authenticate_user(user_id)
    role = User.find_by(id: user_id).role
    @user_id = user_id
    @plan = User.find_by(id: user_id).plan
    if role == "Executive"
      @stake = Stake.find_by(u_id: employee_id)
    else 
      flash[:notice] = "Action not allowed"
    end
  end

  def edit_stake
    user_id = params[:user_id]
    employee_id = params[:employee_id]
    authenticate_user(user_id)
    role = User.find_by(id: user_id).role
    if role == "Executive"
      new_stake_value = params[:stake]
      stake = Stake.find_by(u_id: employee_id)
      stake.value = new_stake_value
      stake.save
      puts "new stake value saved"
    end
    flash[:notice] = ""
    redirect_to(employee_path('user_id' => user_id))
  end
end
