class User < ApplicationRecord
  attr_accessor :id, :email, :name, :password, :role, :company_id
end
