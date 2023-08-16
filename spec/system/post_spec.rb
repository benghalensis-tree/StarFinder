require 'rails_helper'
RSpec.describe '投稿機能', type: :system do
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '新規作成した投稿一覧が表示される' do
        post = FactoryBot.create(:post)
        visit posts_path
        execute_script('window.scrollBy(0,10000)')
        expect(page).to have_content '投稿のタイトル1'
      end
    end
  end
end