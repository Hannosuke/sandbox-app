require 'rails_helper'
require 'rake'

RSpec.configure do |config|
  config.before(:suite) do
    # 全てのrakeタスクを読み込む
    Rails.application.load_tasks
  end

  config.before(:each) do
    # example間での永続性を取り除く
    Rake.application.tasks.each(&:reenable)
  end
end
