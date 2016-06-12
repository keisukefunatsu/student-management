# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 管理者ユーザの作成
["鈴木(管理者)","近藤(管理者)"].each.with_index(1) do |name, n|
  User.create!(email:"admin#{n}@example.com",password:'11111111',name: name ,admin: true, confirmed: true)
end

# 一般ユーザの作成
["大久保","大西","田中","橘","駒田"].each.with_index(1) do |name, n|
  User.create!(email:"user#{n}@example.com",password:'11111111',name: name, admin: false, confirmed: true, current_sign_in_at: Time.zone.now - 1.day )
end

# お知らせの作成
def sample_date(number)
  Date.today + number.days
end

['カレー','焼き肉','受験お疲れ様','うどん','たこ焼き'].each.with_index(1) do |subject, n|
  Information.create!(title:"お知らせ#{n}", expire_date: sample_date(n), start_date: sample_date(n+1),content:"#{subject}パーティをします。奮ってご参加下さい！！", participate: true)
end

user_ids = User.pluck(:id)

# イベントへの参加
user_ids.each do |n|
  Ticket.create!(user_id: n, information_id: Information.pluck(:id).sample, comment: "参加します！")
end


# 指導報告の作成
report =   "今回の指導科目は英語：テキスト20p\n社会:テキスト15p\n前回のテスト結果\n英語:80\n 数学90\n 国語70\n 理科50\n 社会45\n理科、社会が弱いので次の講師は重点的に指導をお願いします。\n"

admins = User.where(admin: true)
user_ids.each do |n|
  Result.create!(user_id: n,title:"#{Date.today}指導報告", content:report, author_id: admins[n % 2].id)
end

# 登下校時間の作成
user_ids.each do |n|
  Timecard.create!(user_id: n,title:"下校時刻")
  Timecard.create!(user_id: n,title:"登校時刻")
end
