# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 管理者ユーザの作成
2.times.each.with_index(1) do |n|
  User.create(email:"admin#{n}@example.com",password:'11111111',name: "admin_user#{n}",admin: true, confirmed: true)
end

# 一般ユーザの作成
5.times.each.with_index(1) do |n|
  User.create(email:"user#{n}@example.com",password:'11111111',name: "test_user#{n}",admin: false, confirmed: true)
end

# お知らせの作成
def sample_date(number)
  Date.today + number.days
end

['カレー','焼き肉','受験お疲れ様','うどん','たこ焼き'].each.with_index(1) do |subject,n|
  if n.odd?
    Information.create(title:"お知らせ#{n}", expire_date: sample_date(n), start_date: sample_date(n+1),content:"#{subject}パーティをします。奮ってご参加下さい！！", participate: true)
  else
    Information.create(title:"お知らせ#{n}", expire_date: sample_date(n), start_date: sample_date(n+1),content:"#{subject}パーティをします。奮ってご参加下さい！！", participate: false)
  end
end

# 指導報告の作成

report =   "今回の指導科目は英語：テキスト20p\n社会:テキスト15p\n前回のテスト結果\n英語:80\n 数学90\n 国語70\n 理科50\n 社会45\n理科、社会が弱いので次の講師は重点的に指導をお願いします。\n"

5.times.each.with_index(1) do |n|
  Result.create(user_id: n+2,title:"#{Date.today}指導報告", content:report)
end
