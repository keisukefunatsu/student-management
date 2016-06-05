require 'rails_helper'

feature 'お知らせ新規作成' do
  let!(:admin_user){ FactoryGirl.create(:admin_user) }
  before do 
    visit new_user_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: '00000000'
    click_button 'Log in'
  end
  context '参加するか尋ねるがonの場合' do
    scenario '再度編集画面を表示するとonになっていること' do
      visit new_information_path
      fill_in 'タイトル', with: 'タイトルテスト'
      fill_in '内容', with: '内容テスト'
      check '参加するか尋ねる'
      click_button '作成'
      visit edit_information_path(Information.last.id)
      expect(page).to have_checked_field('参加するか尋ねる')
    end
  end

  context '参加するか尋ねるがoffの場合' do
    scenario '再度編集画面を表示するとoffになっていること' do
      visit new_information_path
      fill_in 'タイトル', with: 'タイトルテスト'
      fill_in '内容', with: '内容テスト'
      uncheck '参加するか尋ねる'
      click_button '作成'
      visit edit_information_path(Information.last.id)
      expect(page).to have_unchecked_field('参加するか尋ねる')
    end
  end
end

feature 'お知らせ編集' do
  let!(:information){ FactoryGirl.create(:information) }
  let!(:admin_user){ FactoryGirl.create(:admin_user) }
  before do 
    visit new_user_session_path
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: '00000000'
    click_button 'Log in'
  end

  context '参加するか尋ねるがonの場合' do
    scenario '再度編集画面を表示するとonになっていること' do
      visit edit_information_path(information.id)
      check '参加するか尋ねる'
      click_button '更新'
      visit edit_information_path(information.id)
      expect(page).to have_checked_field('参加するか尋ねる')
    end
  end

  context '参加するか尋ねるがoffの場合' do
    scenario '再度編集画面を表示するとoffになっていること' do
      visit edit_information_path(information.id)
      uncheck '参加するか尋ねる'
      click_button '更新'
      visit edit_information_path(information.id)
      expect(page).to have_unchecked_field('参加するか尋ねる')
    end
  end
end
