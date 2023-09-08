require 'mk_calendar'
require 'rails_helper'
RSpec.describe '観測可能時間表示機能', type: :system do
  describe '月齢表示機能' do
    context 'ページを表示した場合' do
      it '月齢アイコンが表示される' do
        day = Date.today
        date_time = day.strftime('%Y%m%d')
        @moon_age = MkCalendar.new("#{date_time}").moonage.round
        visit maps_path
        expect(page).to have_selector("img[src^='/assets/moon_icons/#{@moon_age}-'][src$='.png']")
      end
    end
  end
end
