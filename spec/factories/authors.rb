FactoryBot.define do
  factory :author do
    sequence(:first_name) { |n| "Alan#{n}" }
    last_name { 'Turing' }
  end

  trait :with_homepage do
    homepage { 'http://wikipedia.de/Alan_Turing' }
  end
end
