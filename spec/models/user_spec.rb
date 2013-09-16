require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a password' do
    user.password = ""
    expect(user).not_to be_valid
  end

  it 'is invalid with a wrong password confirmation' do
    user.password_confirmation = "lk"
    expect(user).to have(1).errors_on(:password_confirmation)
  end

  it 'is invalid without an email address' do
    user.email = nil
    expect(user).to have(1).errors_on(:email)
  end

  it 'has an array of books' do
    expect(user.books).to eq([])
  end

  it 'responds with its created books' do
    user.books.build(isbn: 123)
    expect(user.books.map(&:isbn)).to eq([123])
  end
end
