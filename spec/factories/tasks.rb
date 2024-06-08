FactoryBot.define do
  factory :task do
    name { 'テストタスク' }
    description { 'テスト用のタスク' }
    user
  end
end
