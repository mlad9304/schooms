FactoryBot.define do
    factory :user do
        first_name 'Harry'
        last_name  'Potter'
        sequence(:iin) { |n| "#{n}" }
    end
end