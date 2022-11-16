require 'rails_helper'


RSpec.describe HomeController, :type => :controller do
  describe 'Sign in' do
    it "sign in for non existent user" do
      params = {
        "email": "abc@gmail.com",
        "password": "pass"
      }
      post :sign_in_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-in")
    end

    it "sign in for existent user" do
      u = User.create!(email:"abc@gmail.com",
                  password:"pass", name: "abc",
                  role: "Employee", company_id: 1)
      params = {
        "email": "abc@gmail.com",
        "password": "pass"
      }
      post :sign_in_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/employee?user_id=#{u.id}")
    end
    it "sign in with invalid" do
      params = {
        "email": ""
      }
      post :sign_in_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-in")
    end
    it "sign in with wrong password" do
      u = User.create!(email:"abc@gmail.com",
                       password:"pass", name: "abc",
                       role: "Employee", company_id: 1)
      params = {
        "email": "abc@gmail.com",
        "password": "wrong_pass"
      }
      post :sign_in_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-in")
    end
  end
end


RSpec.describe HomeController, :type => :controller do

  describe 'Sign up' do
    it "sign up for Employee with non existent Company" do
      params = {
        "user": {
          "email": "emp1@gmail.com",
          "name": "emp1",
          "password": "pass",
          "company_name": "comp1",
        },
        "role": "Employee",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-up")
    end

    it "sign up for Employee with existing Company" do
      c = Company.create!(name: "comp1")
      params = {
        "user": {
          "email": "emp1@gmail.com",
          "name": "emp1",
          "password": "pass",
          "company_name": "comp1",
        },
        "role": "Employee",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      u = User.find_by(name: "emp1")
      expect(response).to redirect_to("/employee?user_id=#{u.id}")
      expect(!u.nil?).to be_truthy
    end

    it "sign up for Executive with non existent Company" do
      params = {
        "user": {
          "email": "exe1@gmail.com",
          "name": "exe1",
          "password": "pass",
          "company_name": "comp2",
        },
        "role": "Executive",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      u = User.find_by(name: "exe1")
      expect(response).to redirect_to("/employee?user_id=#{u.id}")
      expect(u.nil?).to be_falsy
    end

    it "sign up for non existent Executive with existing Company" do
      c = Company.create!(name: "comp2")
      params = {
        "user": {
          "email": "exe2@gmail.com",
          "name": "exe2",
          "password": "pass",
          "company_name": "comp2",
        },
        "role": "Executive",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      u = User.find_by(name: "exe2")
      expect(response).to redirect_to("/employee?user_id=#{u.id}")
      expect(u.nil?).to be_falsy
    end
    it "sign up for already existing employee" do
      c = Company.create!(name: "comp3")
      u = User.create!(email:"abc@gmail.com",
                       password:"pass", name: "abc",
                       role: "Employee", company_id: c.id)
      params = {
        "user": {
          "email": "abc@gmail.com",
          "name": "abc",
          "password": "pass",
          "company_name": "comp3",
        },
        "role": "Executive",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-up")
    end
    it "sign up with invalid input" do
      params = {
        "user": {
          "email": "abc",
          "name": "abc",
          "password": "pass",
          "company_name": "comp3",
        },
        "role": "Executive",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-up")
    end
    it "sign up with invalid input" do
      params = {
        "user": {
          "email": "",
          "name": "abc",
          "password": "pass",
          "company_name": "comp3",
        },
        "role": "random",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-up")
    end
    it "sign up with empty company" do
      params = {
        "user": {
          "email": "abc@gmail.com",
          "name": "abc",
          "password": "pass",
          "company_name": "",
        },
        "role": "Executive",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-up")
    end
    it "sign up with empty password" do
      params = {
        "user": {
          "email": "abc@gmail.com",
          "name": "abc",
          "password": "",
          "company_name": "comp",
        },
        "role": "Executive",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-up")
    end
    it "sign up with empty name" do
      params = {
        "user": {
          "email": "abc@gmail.com",
          "name": "",
          "password": "pass",
          "company_name": "comp",
        },
        "role": "Executive",
      }
      post :sign_up_new_user, params: params
      expect(response).to have_http_status 302
      expect(response).to redirect_to("/sign-up")
    end
    it "user logs out" do
      session = {
        "user_id": 1
      }
      get(:logout, params: nil, session: session)
      expect(response).to have_http_status 302
      expect(response).to redirect_to("")
    end
  end
end
