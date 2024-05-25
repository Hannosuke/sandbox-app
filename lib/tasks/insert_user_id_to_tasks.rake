# frozen_string_literal: true

namespace :user_id do
  desc "タスクにユーザーIDを挿入する"

  task insert_to_tasks: :environment do
    updated_tasks = []
    faild_tasks = []

    Task.where(user_id: nil).find_each do |task|
      user = User.first

      if task.update(user_id: user.id)
        updated_tasks << task.id
      else
        faild_tasks << task.id
      end
    end

    puts "success tasks: #{updated_tasks.join(', ')}"
    puts "=" * 20
    puts "faild tasks: #{faild_tasks.join(', ')}"
  end
end
