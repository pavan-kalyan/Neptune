class Stake < ApplicationRecord
  # attr_accessor :c_id, :u_id, :value

  def self.get_percentage_stake _stake
    # puts "company id: "
    # puts company_id
    # puts "\n"
    stakes = Stake.where(c_id: _stake.c_id)
    den = 0
    for stake in stakes do
      den = den+Integer(stake.value)
    end
    puts _stake.value
    puts den
    return _stake.value.to_f/den
  end
end
