FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a1" + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    date_of_birth         {Faker::Date.birthday(min_age: 0, max_age: 100)}
  end
end
