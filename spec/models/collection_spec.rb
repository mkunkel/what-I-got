require 'rails_helper'

  describe Collection do
    it { is_expected.to belong_to :user  }
    it { is_expected.to validate_presence_of :user  }
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :book_id }
    it { is_expected.to validate_presence_of :movie_id }
    it { is_expected.to validate_presence_of :album_id }
    it { is_expected.to validate_presence_of :game_id }
    it { is_expected.to validate_presence_of :electronic_id }
end
