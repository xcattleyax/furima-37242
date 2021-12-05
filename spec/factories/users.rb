FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'a0' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '寺田' }
    first_name            { '宏行' }
    last_name_kana        { 'テラダ' }
    first_name_kana       { 'ヒロユキ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
