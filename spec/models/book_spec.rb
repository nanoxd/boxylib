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

  it "is invalid with a duplicate ISBN" do
    phil = create(:book, isbn: 1234)
    emma = build(:book, isbn: 1234)

    expect(emma).to have(1).errors_on(:isbn)
  end

end
