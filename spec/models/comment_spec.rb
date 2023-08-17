require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
    end
    context 'コメントの内容が空の場合' do
      it 'バリデーションにひっかる' do
        comment = Comment.new(content: '',post: @post, user: @user)
        expect(comment).not_to be_valid
      end
    end
    context 'コメントの内容を入力した場合' do
      it 'バリデーションを通過する' do
        comment = Comment.new(content: 'テスト',post: @post, user: @user)
        expect(comment).to be_valid
      end
    end
  end
end