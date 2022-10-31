class Company < ApplicationRecord
  # attr_accessor :id, :name
  def self.get_company_name_by_id company_id
    Company.find_by(id: company_id).name
  end
end
