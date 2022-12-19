require 'rails_helper'

RSpec.describe User, type: :model do
  it "find by id" do

    stake = Stake.create!(u_id: 1, c_id: 5, value: 1)
    expect(Stake.get_percentage_stake(stake)==100).to be_truthy
  end
end
