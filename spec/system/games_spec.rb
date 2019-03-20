require 'rails_helper'

describe '試合情報', type: :system do

  describe '一覧画面' do

    before do
      FactoryBot.create(:game, id: 4)
      FactoryBot.create(:game, id: 2, number: 2)
      FactoryBot.create(:game, id: 3, gameset_flag: true)
      FactoryBot.create(:game, id: 1, gameset_flag: true, disp_date: Time.zone.local(2019, 4, 29))
      @game_infos = GameInfo.all.order(disp_date: :desc, gameset_flag: :asc, number: :desc)
    end

    it '「試合日、試合終了フラグ、第◯試合」の順番で試合情報が並ぶ' do
      expect(@game_infos[0].id).to eq 4
      expect(@game_infos[1].id).to eq 2
      expect(@game_infos[2].id).to eq 3
      expect(@game_infos[3].id).to eq 1
    end

  end

end