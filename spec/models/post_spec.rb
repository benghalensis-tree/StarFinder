require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションのテスト' do
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

  end
end
