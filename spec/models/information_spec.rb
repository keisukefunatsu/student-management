require 'rails_helper'

describe Information do
  describe '#validation' do
    context '開催日が現在日時以降かつ、申し込み期限が開催日時以前の場合' do
      let(:information) { build(:information, start_date: 2.minute.since,
                                              expire_date: 1.minute.since)}
      it 'エラーが生じない' do
        expect(information.valid?).to eq true
      end
    end

    context '開催日が現在日時より過去の場合' do
      let(:information) { build(:information, start_date: 1.minute.ago,
                                              expire_date: 2.minute.ago)}
      it 'エラーメッセージを返す' do
        expect(information.valid?).to eq false
        expect(information.errors.full_messages).to include('開催日は現在時刻以降の値を設定してください')
      end
    end

    context '申し込み期限が開催日時より未来の日時の場合' do
      let(:information) { build(:information, start_date: 1.minute.since,
                                              expire_date: 2.minute.since)}

      it 'エラーメッセージを返す' do
        expect(information.valid?).to eq false
        expect(information.errors.full_messages).to include('申し込み期限は開催日時以前の値を設定してください')
      end
    end
  end
end
