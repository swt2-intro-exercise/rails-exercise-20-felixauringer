FactoryBot.define do
  factory :author do
    sequence(:first_name) { |n| "Alan#{n}" }
    last_name { 'Turing' }
  end

  trait :with_homepage do
    homepage { 'https://wikipedia.de/Alan_Turing' }
  end

  trait :different do
    first_name { 'David Heinemeier' }
    last_name { 'Hansson' }
    homepage { 'https://dhh.dk/' }
  end
end
