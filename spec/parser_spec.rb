require 'spec_helper'

describe Parser do


  it "should also parse games from a different region than North American" do
    replay = File.new("spec/fixtures/1v1-game-la.sc2replay")

    replay = Parser.parse(replay)
    replay.first_player.should == "pellegrino"
    replay.second_player.should == "DeusEx"
    replay.map.should == "Cavernas Xel'Naga"
  end

  it "should return a replay instance containing both players and the map name" do
    replay = File.new("spec/fixtures/1v1-game2.sc2replay")

    replay = Parser.parse(replay)
    replay.first_player.should == "pellegrino"
    replay.second_player.should == "Arlequim"
    replay.map.should == "Vale da Selva"
  end

end
