FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {Faker::Name.last_name.katakana}
    first_name {Faker::Name.first_name.katakana}
    last_name_kana {Faker::Name.last_name.katakana}
    first_name_kana {Faker::Name.first_name.katakana}
    date_of_birth {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
