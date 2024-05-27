require "rails_helper"
require "rake_helper"

describe "insert_user_id_to_tasks", type: :task do
  describe "user_id:insert_to_tasks" do
    let(:task) { Rake.application["user_id:insert_to_tasks"] }

    before do
      create(:user)

      5.times do |i|
        Task.create(name: "task#{i}", user_id: nil)
      end
    end

    it "全てのタスクにユーザーが関連づけられる" do
      expect { task.invoke }.to change { Task.where(user_id: nil).count }.from(5).to(0)
    end
  end
end
