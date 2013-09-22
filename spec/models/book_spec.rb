require 'spec_helper'

describe Book do
  let(:book) { FactoryGirl.create(:book)}

  it 'is valid' do
    expect(book).to be_valid
  end

  it "is invalid with an ISBN over 14 digits" do
    book.isbn = 12345678901234
    expect(book).to have(1).errors_on(:isbn)
  end

  it 'is associated with a user' do
    expect(book).to respond_to(:user)
  end

end
