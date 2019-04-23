FactoryBot.define do
  factory :game, class: GameInfo do
    batting_first_team {'星槎道都大学'}
    field_first_team {'札幌大谷大学'}
    disp_date {Time.zone.local(2019, 4, 30)}
    season {'春季'}
    event {'1部リーグ戦'}
    round {'第一節'}
    stadium {'札幌円山球場'}
    gameset_flag {false}
    number {3}
  end
end