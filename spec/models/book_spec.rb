require 'spec_helper'

describe Book do
  let(:book) { FactoryGirl.create(:book)}

  it 'is valid' do
    expect(book).to be_valid
  end

  it "is not valid with an ISBN over 14 digits" do
    book.isbn = 12345678901234
    expect(book).not_to be_valid
  end

  it "prevents duplicate ISBNs" do
    user1 = Book.create(isbn: 1232)
    user2 = Book.create(isbn: 1232)

    expect(user1).to be_valid
    expect(user2).not_to be_valid(:isbn)
  end
end
