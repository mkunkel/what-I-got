require 'rails_helper'

describe Book do

  it "has a valid factory" do
    @book = Fabricate(:book).should be_valid
  end

  it { should respond_to(:title) }
  it { should respond_to(:author) }

end
