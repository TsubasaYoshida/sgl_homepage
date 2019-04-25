require 'rails_helper'

describe GameInfosController, type: :controller do

  before do
    create(:game, id: 4)
    create(:game, id: 2, number: 2)
    create(:game, id: 3, gameset_flag: true)
    create(:game, id: 1, gameset_flag: true, disp_date: Time.zone.local(2019, 4, 29))
    @game_infos = GameInfo.all.standard
  end

  describe '#index' do

    it "正常にレスポンスを返すこと" do
      get :index
      expect(response).to be_successful
    end

    it "「試合終了フラグ、試合日、第◯試合」の順番で試合情報が並ぶ" do
      expect(@game_infos[0].id).to eq 4
      expect(@game_infos[1].id).to eq 2
      expect(@game_infos[2].id).to eq 3
      expect(@game_infos[3].id).to eq 1
    end

  end

  describe '#show' do

    it "正常にレスポンスを返すこと" do
      game = create(:game)
      get :show, params: {id: game.id}
      expect(response).to be_successful
    end

  end
end