class Company < ApplicationRecord
  # attr_accessor :id, :name
  def self.get_company_name_by_id company_id
    # puts "company id: "
    # puts company_id
    # puts "\n"
    Company.find_by(id: company_id).name
  end
end
