FactoryGirl.define do
  factory :step do
    step_number 1
    kind 1
    selector "MyString"
    script_code "MyText"
    response "MyText"
    store_datalayer false
    datalayer "MyText"
  end
end
