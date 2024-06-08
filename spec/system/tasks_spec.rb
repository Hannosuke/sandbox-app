require 'rails_helper'

describe "タスク管理機能", type: :system do
  describe "新規作成" do
    let(:user) { create(:user) }

    before do
      visit login_path

      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
    end

    it "タスクが作成できる" do
      visit new_task_path

      fill_in "task_name", with: "テストタスク"
      click_button "save"

      expect(page).to have_content "Task created successfully"
      expect(Task.last.user_id).to eq user.id
    end
  end
end
