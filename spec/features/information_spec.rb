require 'rails_helper'

feature 'お知らせ新規作成/編集' do
  let!(:admin_user){ FactoryGirl.create(:user, :as_admin) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: '00000000'
    click_button 'Log in'
  end

  scenario '「参加するか尋ねる」をonにして更新すると再度訪問時onが表示され、offにして更新すると再度訪問時offになっていること' do
    visit new_information_path
    fill_in 'タイトル', with: 'タイトルテスト'
    fill_in '内容', with: '内容テスト'
    check '参加するか尋ねる'
    click_button '作成'

    information = Information.last
    visit edit_information_path(information)
    expect(page).to have_checked_field('参加するか尋ねる')

    uncheck '参加するか尋ねる'
    click_button '更新'
    visit edit_information_path(information)
    expect(page).to have_unchecked_field('参加するか尋ねる')
  end
end
