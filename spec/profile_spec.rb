require 'rails_helper'

RSpec.describe ProfileController, :type => :controller do
  describe 'View Profile' do
    it "view profile for user that has not logged in" do
        c = Company.create!(name: "comp")
        u = User.create!(email: "emp@gmail.com", name: "sid", password: "password", role: "Executive", company_id: 1, plan: "Free")
        s = Stake.create!(u_id: u.id, c_id: c.id, value: "20")
        params = {
            "user_id": 1
        }
        get :show, params: params
        expect(response).to redirect_to("/sign-in")
    end

    it "view profile for user that has logged in" do
        c1 = Company.create!(name: "comp")
        u1 = User.create!(email: "abc1@gmail.com", name: "sid", password: "password", role: "Executive", company_id: c1.id, plan: "Free")
        Stake.create!(u_id: u1.id, c_id: c1.id, value: "20")
        session = {
            "user_id": u1.id
        }
        params = {
            "user_id": u1.id
        }
        get :show, params: params, session: session
        expect(response.status).to be 200
    end

    it "edit plan for user" do
        c1 = Company.create!(name: "comp")
        u1 = User.create!(email: "abc1@gmail.com", name: "sid", password: "password", role: "Executive", company_id: c1.id, plan: "Free")
        Stake.create!(u_id: u1.id, c_id: c1.id, value: "20")
        session = {
            "user_id": u1.id
        }
        params = {
            "user_id": u1.id,
            "plan": "Paid"
        }
        post :edit, params: params, session: session
        puts response.status
        puts response.parsed_body()
        expect(response.status).to redirect_to("/employee?user_id=#{u1.id}")
    end

  end
end
