json.extract! case_test, :id, :title, :description, :url, :timestamps, :created_at, :updated_at
json.url case_test_url(case_test, format: :json)