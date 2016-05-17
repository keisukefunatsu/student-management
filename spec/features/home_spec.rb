require 'rails_helper'

feature 'Home' do
  # RSpecの動作確認用なので削除して良い
  scenario 'トップページが表示されること' do
    visit root_path
    expect(page).to have_http_status :ok
  end

  # RSpecの動作確認用なので削除して良い
  scenario 'JSドライバが動作すること', js: true do
    visit root_path
    expect(page).to have_http_status :ok
  end
end