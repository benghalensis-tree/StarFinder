require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
    context 'FactoryBotで作成する場合' do
      it 'バリデーションを通過する' do
        post = FactoryBot.build(:post)
        expect(post).to be_valid
      end
    end
    context '投稿のタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        post = FactoryBot.build(:post, title: '')
        expect(post).not_to be_valid
      end
    end
    context '投稿のコンテントが空の場合' do
      it 'バリデーションにひっかる' do
        post = FactoryBot.build(:post, content: '')
        expect(post).not_to be_valid
      end
    end
    context '緯度経度が空の場合' do
      it 'バリデーションにひっかる' do
        post = FactoryBot.build(:post, latitude: '', longitude: '')
        expect(post).not_to be_valid
      end
    end
    context '適切に入力されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        post = Post.new(title: '成功テスト', content: '成功テスト', access_date: Date.today, latitude: 36, longitude: 138, user: user )
        expect(post).to be_valid
      end
    end

  end
end
