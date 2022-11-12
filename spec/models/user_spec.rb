require 'rails_helper'

RSpec.describe User, type: :model do
  it "find by id" do

    u = User.create!(email:"abc@gmail.com",
                     password:"pass", name: "abc",
                     role: "Employee", company_id: 1)
    expect(User.get_user_name_by_id(u.id)==u.name).to be_truthy
  end
end
