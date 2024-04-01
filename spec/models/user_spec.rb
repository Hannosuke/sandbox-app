require 'rails_helper'

describe User do
  describe 'valid?' do
    describe 'name' do
      let(:user) { build(:user, name: name) }

      subject { user.valid? }

      context 'nilのとき' do
        let(:name) { nil }

        it { is_expected.to be false }
      end
    end

    describe 'email' do
      let(:user) { build(:user, email: email) }

      subject { user.valid? }

      context 'nilのとき' do
        let(:email) { nil }

        it { is_expected.to be false }
      end

      context '既に同じemailを持つユーザーが存在するとき' do
        before { create(:user, email: email) }
        let(:email) { 'sample@example.com' }

        it { is_expected.to be false }
      end
    end
  end
end
