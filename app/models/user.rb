class User < ApplicationRecord
  def self.get_user_name_by_id user_id
    # puts "user id: "
    # puts user_id
    # puts "\n"
    User.find_by(id: user_id).name
  end
end
