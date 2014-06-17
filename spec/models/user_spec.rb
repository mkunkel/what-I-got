require 'rails_helper'

describe User do
  it { should validate_uniqueness_of :username }
# RSpec.describe User, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
end
