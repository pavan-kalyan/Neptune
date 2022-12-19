class ProfileController < ApplicationController


  def show
    flash[:message] = ""
    user_id = params[:user_id]
    authenticate_user(user_id)
    @user = User.find_by(id: user_id)
    # redirect_to profile_path
    response.headers["Cache-Control"] = "no-cache, no-store"
  end

  def edit
    flash[:message] = ""
    user_id = params[:user_id]
    plan = params[:plan]
    authenticate_user(user_id)
    user = User.find_by(id: user_id)
    puts(user)
    user.update(plan: plan)
    flash[:message] = "Updated Plan"
    redirect_to employee_path(user_id: user_id)
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
end
