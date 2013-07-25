require 'spec_helper'

describe 'User' do
  it 'is valid with email, name and password' do
    user = User.new(
        name: "Csaba",
        email: "icnagy@gmail.com",
        password: "secret"
    )
    expect(user).to be_valid
  end
  it "is invalid without a name" do
    expect(User.new(name: nil)).to have(1).errors_on(:name)
  end
  it "is invalid without a password" do
    expect(User.new(password: nil)).to have(1).errors_on(:password)
  end
  it "is invalid without an email" do
    expect(User.new(email: nil)).to have(1).errors_on(:email)
  end
  it "is invalid with a duplicate email address" do
    User.create(
        name: 'Joe Tester',
        password: 'secret',
        email: 'tester@example.com')
    user = User.new(
        name: 'Jane Tester',
        password: 'secret',
        email: 'tester@example.com')
    expect(user).to have(1).errors_on(:email)
  end
end