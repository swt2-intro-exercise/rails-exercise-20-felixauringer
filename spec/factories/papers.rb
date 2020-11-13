FactoryBot.define do
  factory :paper do
    sequence(:title) { |n| "COMPUTING MACHINERY AND INTELLIGENCE VOL #{n}" }
    venue { 'Mind 49: 433-460' }
    year { 1950 }
  end

  trait :with_authors do
    authors { FactoryBot.create_list :author, 5 }
  end
end
