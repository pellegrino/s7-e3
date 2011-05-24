require 'spec_helper'

describe SC2Refinery::Replay do
  subject do
    SC2Refinery::Replay.new(:map => "The Lost Temple",
                            :first_player => "pellegrino",
                            :second_player => "DeusEx")
  end 
  
  its(:first_player)  { should == "pellegrino"      } 
  its(:second_player) { should == "DeusEx"          }
  its(:map)           { should == "The Lost Temple" }
  
end
