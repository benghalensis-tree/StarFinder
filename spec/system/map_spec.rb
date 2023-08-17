require 'rails_helper'
RSpec.describe 'マップ機能', type: :system do
  describe '投稿マーカー表示機能' do
    context 'マップページを表示した場合' do
      it '投稿マーカーが表示される' do
        post = FactoryBot.create(:post)
        visit posts_path
        expect(page).to have_css('.yNHHyP-marker-view')
      end
    end
  end
end
