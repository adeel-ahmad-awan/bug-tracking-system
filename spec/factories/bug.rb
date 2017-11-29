FactoryGirl.define do
  factory :bug do
    name "bug1"
    description "this is description"
    priority "low"
    status "open"
    reported_by "someone"
    association :project
  end

end
