require 'rails_helper'
RSpec.describe 'お気に入り機能', type: :system do
  describe 'お気に入り登録機能' do
    context '投稿をお気に入りした場合' do
      it 'フラッシュメッセージが表示される' do
        @user = FactoryBot.create(:user_2)
        @post = FactoryBot.create(:post)
        visit new_user_session_path
        fill_in 'user_email', with: 'user1@test.com'
        fill_in 'user_password', with: 111111 
        click_on 'commit'
        visit post_path(@post)
        click_on 'お気に入り'
        expect(page).to have_content 'お気に入り登録しました'
      end
    end
  end
end
