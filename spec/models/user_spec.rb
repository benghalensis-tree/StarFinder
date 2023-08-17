require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'FactoryBotで作成する場合' do
      it 'バリデーションを通過する' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.build(:user, name: '')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのメールアドレスが空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.build(:user, email: '')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのパスワードが空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.build(:user, password: '')
        expect(user).not_to be_valid
      end
    end
  end
end
