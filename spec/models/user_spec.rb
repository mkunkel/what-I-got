require 'rails_helper'

describe User do
  it { is_expected.to have_many :collections }
  it { is_expected.to validate_uniqueness_of :username }
  it { is_expected.to validate_uniqueness_of :email }

  describe 'username' do
    it { is_expected.to allow_value('Kathy').for(:username) }
    it { is_expected.to allow_value('Kathy69').for(:username) }
    it { is_expected.not_to allow_value('Kat hy').for(:username) }
    it { is_expected.not_to allow_value('K@thy').for(:username) }
    it { is_expected.not_to allow_value('Kathy=kathy').for(:username) }
    it { is_expected.not_to allow_value('K&thy').for(:username) }
  end
end
