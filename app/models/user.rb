class User < ApplicationRecord
  def self.get_user_name_by_id user_id
    User.find_by(id: user_id).name
  end
end
