require 'rails_helper'

RSpec.describe StakesController, :type => :controller do

    describe 'View Stake' do
        it "view stake for user that has not logged in" do
            c = Company.create!(name: "comp")
            u = User.create!(email: "emp@gmail.com", name: "sid", password: "password", role: "Executive", company_id: 1)
            s = Stake.create!(u_id: "1", c_id: "1", value: "20")
            params = {
                "user_id": 1
            }
            get :show, params: params
            expect(response).to redirect_to("/sign-in")
        end

        it "view stake for user that has logged in" do
            c1 = Company.create!(name: "comp")
            u1 = User.create!(email: "abc1@gmail.com", name: "sid", password: "password", role: "Executive", company_id: c1.id)
            u2 = User.create!(email: "abc2@gmail.com", name: "pavan", password: "password", role: "Employee", company_id: c1.id)
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "20")
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "80")
            session = {
                "user_id": u1.id
            }
            params = {
                "user_id": u1.id
            }
            get :show, params: params, session: session
            expect(response.status).to be 200
        end

        it "edit stake for user as executive" do
            c1 = Company.create!(name: "comp")
            u1 = User.create!(email: "abc1@gmail.com", name: "sid", password: "password", role: "Executive", company_id: c1.id)
            u2 = User.create!(email: "abc2@gmail.com", name: "pavan", password: "password", role: "Employee", company_id: c1.id)
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "20")
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "80")
            session = {
                "user_id": u1.id
            }
            params = {
                "user_id": u1.id,
                "employee_id": u2.id
            }
            get :edit, params: params, session: session
            expect(response.status).to be 200
        end

        it "edit stake for user as employee" do
            c1 = Company.create!(name: "comp")
            u1 = User.create!(email: "abc1@gmail.com", name: "sid", password: "password", role: "Executive", company_id: c1.id)
            u2 = User.create!(email: "abc2@gmail.com", name: "pavan", password: "password", role: "Employee", company_id: c1.id)
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "20")
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "80")
            session = {
                "user_id": u2.id
            }
            params = {
                "user_id": u2.id,
                "employee_id": u2.id
            }
            get :edit, params: params, session: session
            expect(response.status).to be 200
        end

        it "edit stake value for a user" do
            c1 = Company.create!(name: "comp")
            u1 = User.create!(email: "abc1@gmail.com", name: "sid", password: "password", role: "Executive", company_id: c1.id)
            u2 = User.create!(email: "abc2@gmail.com", name: "pavan", password: "password", role: "Employee", company_id: c1.id)
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "20")
            Stake.create!(u_id: u2.id, c_id: c1.id, value: "80")
            session = {
                "user_id": u1.id
            }
            params = {
                "user_id": u1.id,
                "employee_id": u2.id,
                "stake": 100
            }
            get :edit_stake, params: params, session: session
            expect(response.status).to redirect_to("/employee?user_id=#{u1.id}")
        end
    end
end