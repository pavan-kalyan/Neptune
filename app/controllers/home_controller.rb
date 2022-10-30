class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end
  def sign_up
  end
  def sign_up_new_user
    puts(user_params)
    puts("started")
    company = Company.find_by(name: params[:company_name])
    if (company.nil? && params[:role] == 'Employee')
      flash[:notice] = "company does not exist"
      return
    elsif (company.nil?) 
      company = Company.create!(params[:company_name])
    end

    if (params[:email].blank?)
      flash[:notice] = "blank email"
      return
    end
    puts("so far fine")
    user = User.find_by(email: params[:email]) 
    if (!user.nil?)
      flash[:notice] = "email already exists"
      return
    end
    user = User.create!(email: params[:email],password: params[:password], name: params[:name],role: params[:role],company_id: company.id)
    puts(user)
  end
   def user_params
    params.require(:user).permit(:name, :email, :password, :role, :company_name)
  end
end