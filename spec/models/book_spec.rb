require 'rails_helper'

describe Book do

  it "has a valid factory" do
    # book = create(:book).should be_valid
    @book = Fabricate(:book).should be_valid
  end

  it { should respond_to(:title) }
  it { should respond_to(:author) }

  it "is invalid without a title" do
    @book = Fabricate(:book).should_not be_valid
  end
  #
  # it "returns a user's title as a string" do
  #   book = create(:book, title: "the Great Gatsby")
  #   book.title.should == "the Great Gatsby"
  # end
end
