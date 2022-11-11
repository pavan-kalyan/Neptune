class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end
  
  def sign_up
  end
  
  def sign_in
  end
  
  def sign_in_user
    user = User.find_by(email: params["email"])
    if (user.nil?) 
      flash[:notice] = "user does not exist"
      puts "non existent user"
      redirect_to sign_in_path
      return
    end
    if (user.password != params["password"])
      flash[:notice] = "incorrect password"
      puts "failed to login"
      redirect_to sign_in_path
      return
    end

    redirect_to employee_path('user_id' => user.id)
  end
  
  def sign_up_new_user
    user_input = user_params
    user_input['role'] = params[:role]
    puts(params)
    if (user_input['role'] != 'Employee' && user_input['role'] != 'Executive')
      flash[:notice] = "incorrect role"
      puts("INCORRECT ROLE")
      redirect_to sign_up_path
      return
    end
    company_name = params[:user]["company_name"]
    company = Company.find_by(name: company_name)
    if (!Company.exists?(name: company_name) && user_input['role'] == 'Employee')
      flash[:notice] = "company does not exist"
      redirect_to sign_up_path
      return
    elsif (!Company.exists?(name: company_name)) 
      puts("inserting company with name #{company_name}")
      company = Company.create!(name: company_name)
    end

    if (user_input[:email].blank?)
      flash[:notice] = "blank email"
      redirect_to sign_up_path
      return
    end
    
    user = User.find_by(email: user_input['email']) 
    if (!user.nil?)
      flash[:notice] = "email already exists"
      redirect_to sign_up_path
      return
    end

    user = User.create!(email: user_input['email'],password: user_input['password'], name: user_input['name'],role: user_input['role'],company_id: company.id)
    
    redirect_to employee_path('user_id' => user.id)
  end
  
   def user_params
    params.require(:user).permit(:name, :email, :password, :role, :company_name)
  end
end