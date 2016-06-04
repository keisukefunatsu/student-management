require 'rails_helper'

describe User do
  describe '#increase_grade' do
    context '学年がある場合' do
      subject { create(:user, :student) }
      it '次の学年に更新されている' do
        expected = subject.grade.next_grade_code
        subject.increase_grade
        expect(subject.grade_code).to eq expected
      end
    end

    context '学年がない場合' do
      subject { create(:user) }
      it '学年が更新されない' do
        subject.increase_grade
        expect(subject.grade_code).to be_nil
      end
    end
  end

  describe '#increase_grade!' do
    context '学年がある場合' do
      subject { create(:user, :student) }
      it '次の学年に更新されている' do
        expected = subject.grade.next_grade_code
        subject.increase_grade!
        expect(subject.grade_code).to eq expected
      end
    end

    context '学年がない場合' do
      subject { create(:user) }
      it 'エラーが発生する' do
        expect{subject.increase_grade!}.to raise_error '学年が設定されていません'
      end
    end
  end

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
