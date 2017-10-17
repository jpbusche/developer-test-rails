require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
  	user = User.new(username: "RoDrIgO", email: "rodrigo@email.com", password: "123456", password_confirmation: "123456")
  	expect(user).to be_valid
  end
  it "is not valid without an username" do
  	user = User.new(username: nil, email: "rodrigo@email.com", password: "123456", password_confirmation: "123456")
  	expect(user).to_not be_valid
  end
  it "is not valid without an email" do
  	user = User.new(username: "RoDrIgO", email: nil, password: "123456", password_confirmation: "123456")
  	expect(user).to_not be_valid
  end
  it "is not valid without a password" do
  	user = User.new(username: "RoDrIgO", email: "rodrigo@email.com", password: nil, password_confirmation: "123456")
  	expect(user).to_not be_valid
  end
  it "is not valid if password confirmation is different" do
  	user = User.new(username: "RoDrIgO", email: "rodrigo@email.com", password: "123456", password_confirmation: "654321")
  	expect(user).to_not be_valid
  end
end
