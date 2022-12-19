require 'rails_helper'

RSpec.describe Stake, type: :model do
  it "list" do

    u = User.create!(email:"abc@gmail.com",
                     password:"pass", name: "abc",
                     role: "Employee", company_id: 1)
    expect(User.get_user_name_by_id(u.id)==u.name).to be_truthy
  end
end
# frozen_string_literal: true

