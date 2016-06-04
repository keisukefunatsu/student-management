require 'rails_helper'

describe Information do
  describe '#update' do
    let(:information) { create(:information, title: 'タイトル',
                                             content: '内容',
                                             start_date: Time.now + 2.hour,
                                             expire_date: Time.now + 1.hour)}

    context '開催日が現在日時より過去の場合' do
      it 'エラーメッセージを返す' do
        expect{information.update!(start_date: Time.now)}.to raise_error(ActiveRecord::RecordInvalid, include('開催日は現在時刻以降の値を設定してください'))
      end
    end

    context '申し込み期限が開催日時より過去の日時の場合' do
      it 'エラーメッセージを返す' do
        expect{information.update!(expire_date: information.start_date + 1.second)}.to raise_error(ActiveRecord::RecordInvalid, 'バリデーションに失敗しました: 申し込み期限は開催日時以前の値を設定してください')
      end
    end
  end
end
