require 'rails_helper'

RSpec.describe HomeController do
  describe 'visitor sign up' do
    it 'sign up email' do

      u = User.create!(email: 'e', name: 'e',role: 'Executive', password: 'pass')
      expect(User.first().email== 'e').to be_truthy
    end
end
# RSpec.describe 'Visitor signs up' do
#   context 'via email' do
#     visit sign_up_path
#     expect(page).to have_content("First name")
#   end
# end
# describe ApplicationController do
#   describe 'creating movies' do
#     it 'calls the model method that adds new movies' do
#       # Movie.create(title: "t1")
#       expect(0 == 1).to be_truthy
#     end
#   end
#   describe 'deleting movies' do
#     it 'calls the model method that deletes the movie' do
#       # movie = Movie.create(title: "t1")
#       # movie.destroy()
#       # expect(Movie.exists?(title: "t1")).to be_falsey
#     end
#   end
# end