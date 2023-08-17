require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @post = FactoryBot.create(:post)
    end
    context '評価が空の場合' do
      it 'バリデーションにひっかる' do
        rating = Rating.new(sky_light: '',sky_clear: 2, sky_extent: 3, accessiblity: 4, convenient: 5, post: @post)
        expect(rating).not_to be_valid
      end
    end
    context '評価の値が1~5以外の場合' do
      it 'バリデーションにひっかる' do
        rating = Rating.new(sky_light: 0,sky_clear: 2, sky_extent: 3, accessiblity: 4, convenient: 5, post: @post)
        rating2 = Rating.new(sky_light: 100,sky_clear: 2, sky_extent: 3, accessiblity: 4, convenient: 5, post: @post)
        rating3 = Rating.new(sky_light: '不正な値',sky_clear: 2, sky_extent: 3, accessiblity: 4, convenient: 5, post: @post)
        expect(rating).not_to be_valid
        expect(rating2).not_to be_valid
        expect(rating3).not_to be_valid
      end
    end
    context '評価を適切に入力した場合' do
      it 'バリデーションを通過する' do
        rating = Rating.new(sky_light: 1,sky_clear: 2, sky_extent: 3, accessiblity: 4, convenient: 5, post: @post)
        expect(rating).to be_valid
      end
    end
  end
end