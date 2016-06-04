require 'rails_helper'

describe User do
  describe '#recent_timecard' do
    subject { create(:user) }
    before do
      10.times { create(:timecard, user: subject) }
    end

    it '最新のタイムカードを返す' do
      last_timecard = Timecard.where(user: subject).order(created_at: :desc).first
      expect(subject.recent_timecard).to eq last_timecard
    end
  end
end
