require 'spec_helper'

describe Parser do

  it "should parse replays correctly" do
    validate_parsing("1v1-game1.sc2replay",
                     :first_player => "pellegrino",
                     :second_player => "DeusEx",
                     :map => "Cavernas Xel'Naga")

    validate_parsing("1v1-game2.sc2replay",
                     :first_player => "pellegrino",
                     :second_player => "Arlequim",
                     :map => "Vale da Selva")

    validate_parsing("1v1-game3.sc2replay",
                     :first_player => "pellegrino",
                     :second_player => "Narsejaum",
                     :map => "Cavernas Xel'Naga")

    validate_parsing("1v1-game4.sc2replay",
                     :first_player => "Slaughter",
                     :second_player => "pellegrino",
                     :map => "Metal\xC3\xB3polis") # Metalópolis
                                                   # encoded in ISO-8859-1
  end
  it "should parse correctly older version replays" do
    validate_parsing("1v1-game5-old-version.sc2replay",
                     :first_player => "WolfMan",
                     :second_player => "Boom",
                     :map => "Abyss")

  end

  private
  def validate_parsing(replay_name, params)
    replay = Parser.parse(File.new("spec/fixtures/#{replay_name}"))
    replay.first_player.should == params[:first_player]
    replay.second_player.should == params[:second_player]
    replay.map.should == params[:map]
  end


end
