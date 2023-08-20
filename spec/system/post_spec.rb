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
  describe '新規作成機能' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@test.com'  
      fill_in 'user_password', with: 111111
      click_on 'sign_in_btn'
      sleep 0.5
    end
    context '投稿を新規作成した場合' do
      it '作成した投稿が表示される' do
        visit new_post_path
        fill_in 'post_title', with: 'テストタイトル'  
        fill_in 'post_content', with: 'テストコンテント'  
        find('#map').click(x: 10, y: 10)
        choose 'sky_light4'
        choose 'sky_clear2'
        click_button '投稿'
        execute_script('window.scrollBy(0,10000)')
        expect(page).to have_content 'テストタイトル'
        expect(page).to have_content 'テストコンテント'
      end
    end
  end
  describe '投稿編集機能' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@test.com'  
      fill_in 'user_password', with: 111111
      click_on 'sign_in_btn'
      sleep 0.5
    end
    context '投稿を編集した場合' do
      it '編集したタイトルが表示される' do
        visit edit_post_path(@post)
        fill_in 'post_title', with: '編集したタイトル'  
        click_button '登録'
        execute_script('window.scrollBy(0,10000)')
        expect(page).to have_content '編集したタイトル'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意の投稿詳細画面に遷移した場合' do
      it '該当投稿の内容が表示される' do
        post = FactoryBot.create(:post)
        visit post_path(post)
        expect(page).to have_content '投稿のタイトル1'
      end
    end
 end
  describe '投稿ソート・検索機能' do
    before do
      user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: user, title: '投稿1', view_count: 1111, favorite_count: 111)
      sleep 1
      @post_2 = FactoryBot.create(:post, user: user, title: '投稿2', view_count: 2222, favorite_count: 22)
      sleep 1
      @post_3 = FactoryBot.create(:post, user: user, title: '投稿3', view_count: 3333, favorite_count: 3)
      sleep 1
    end
    context 'キーワードで検索した場合' do
      it 'キーワードを含む投稿が表示される' do
        visit posts_path
        fill_in 'q_title_or_address_cont', with: '投稿1'  
        click_on '検索'
        sleep 1
        execute_script('window.scrollBy(0,10000)')
        expect(page).to have_content '投稿1'
        expect(page).not_to have_content '投稿2'
      end
    end
    context '閲覧数ソートボタンを押した場合' do
      it '閲覧数の多い投稿が1番目にくる' do
        visit posts_path
        click_on 'view_count_sort'
        sleep 1
        execute_script('window.scrollBy(0,10000)')
        expect(page.text).to match(/#{@post_3.title}[\s\S]*#{@post_2.title}/)
      end
    end
    context 'お気に入りソートボタンを押した場合' do
      it 'お気に入りの多い投稿が1番目にくる' do
        visit posts_path
        click_on 'favorite_count_sort'
        sleep 1
        execute_script('window.scrollBy(0,10000)')
        expect(page.text).to match(/#{@post.title}[\s\S]*#{@post_2.title}/)
      end
    end
  end
end