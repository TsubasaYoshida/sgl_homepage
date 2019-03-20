FactoryBot.define do
  factory :game, class: GameInfo do
    batting_first_team '先攻チーム'
    field_first_team '後攻チーム'
    disp_date Time.zone.local(2019, 4, 30)
    gameset_flag false
    number 3
  end
end