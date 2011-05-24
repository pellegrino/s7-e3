require 'spec_helper'

describe SC2Refinery::Replay do

  before do
    @replay =  SC2Refinery::Replay.new(:map => "The Lost Temple", :first_player => "pellegrino", :second_player => "DeusEx")
  end

  it "should have first player's name" do
    @replay.first_player.should == "pellegrino"
  end

  it "should have second player's name" do
    @replay.second_player.should == "DeusEx"
  end

  it "should have the map where this match was played"  do
    @replay.map.should == "The Lost Temple"
  end

end
