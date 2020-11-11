FactoryBot.define do
  factory :author do
    first_name { 'Alan' }
    last_name { 'Turing' }
  end

  trait :with_homepage do
    homepage { 'http://wikipedia.de/Alan_Turing' }
  end
end
