# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


companies = [{:name => 'Martian'}]

users = [
    {:email => "abc1@gmail.com", :name => 'Sid', :password => 'password', :role => 'Employee', :company_id => '1'},
    {:email => 'abc2@gmail.com', :name => 'Pavan', :password => 'password', :role => 'Executive', :company_id => '1'},
    {:email => 'abc3@gmail.com',:name => 'Twisha', :password => 'password', :role => 'Employee', :company_id => '1'},
    {:email => 'abc4@gmail.com', :name => 'Ash', :password => 'password',:role => 'Employee', :company_id => '1'}
]

stakes = [
    {:c_id => '1', :u_id => '3', :value => '20'},
    {:c_id => '1', :u_id => '4', :value => '20'},
    {:c_id => '1', :u_id => '2', :value => '50'},
    {:c_id => '1', :u_id => '1', :value => '10'}
]

companies.each do |company|
    Company.create!(company)
end

users.each do |user|
    User.create!(user)
end

stakes.each do |stake|
    Stake.create!(stake)
end