require 'rails_helper'

describe Timecard do
  context "タイトルが#{Timecard::COMING_TITLE}の場合" do
    subject { create(:timecard) }
    describe '#coming?' do
      it 'trueを返す' do
        expect(subject.coming?).to eq true
      end
    end

    describe '#out?' do
      it 'falseを返す' do
        expect(subject.out?).to eq false
      end
    end
  end

  context "タイトルが#{Timecard::OUT_TITLE}の場合" do
    subject { create(:timecard, title: Timecard::OUT_TITLE) }
    describe '#coming?' do
      it 'falseを返す' do
        expect(subject.coming?).to eq false
      end
    end

    describe '#out?' do
      it 'trueを返す' do
        expect(subject.out?).to eq true
      end
    end
  end

  context "タイトルが想定外の場合" do
    describe '#valid?' do
      subject { Timecard.new(user: create(:user), title: 'unexpected title') }
      it 'falseとなること' do
        expect(subject.valid?).to eq false
      end
    end
  end
end
