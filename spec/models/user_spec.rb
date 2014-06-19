require 'rails_helper'

describe User do
  it { should have_one :collection }
  it { should validate_uniqueness_of :username }
  it { should validate_uniqueness_of :email }  #not sure this testing is passing properly

  describe 'username' do
    it { should allow_value('Kathy').for(:username) }
    it { should allow_value('Kathy69').for(:username) }
    it { should_not allow_value('Kat hy').for(:username) }
    it { should_not allow_value('K@thy').for(:username) }
    it { should_not allow_value('Kathy=kathy').for(:username) }
    it { should_not allow_value('K&thy').for(:username) }
  end
end
