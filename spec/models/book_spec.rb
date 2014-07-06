require 'rails_helper'

describe Book do

  it "has a valid factory" do
    expect(Fabricate(:book)).to be_valid
  end

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:author) }

end
