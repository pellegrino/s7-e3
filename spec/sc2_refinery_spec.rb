require 'spec_helper'

describe SC2Refinery do

  context '.load'  do

    describe 'first replay' do
      subject { SC2Refinery.load("spec/fixtures/1v1-game1.sc2replay") }

      its(:first_player)  { should == "pellegrino"        }
      its(:second_player) { should == "DeusEx"            }
      its(:map)           { should == "Cavernas Xel'Naga" }
    end

    describe 'second replay' do
      subject { SC2Refinery.load("spec/fixtures/1v1-game2.sc2replay") }

      its(:first_player)  { should == "pellegrino"        }
      its(:second_player) { should == "Arlequim"          }
      its(:map)           { should == "Vale da Selva"     }
    end
    describe 'third replay' do
      subject { SC2Refinery.load("spec/fixtures/1v1-game3.sc2replay") }

      its(:first_player)  { should == "pellegrino"        }
      its(:second_player) { should == "Narsejaum"         }
      its(:map)           { should == "Cavernas Xel'Naga" }
    end
    describe 'forth replay' do
      subject { SC2Refinery.load("spec/fixtures/1v1-game4.sc2replay") }

      its(:first_player)  { should == "Slaughter"          }
      its(:second_player) { should == "pellegrino"         }
      # Metalópolis encoded in ISO-8859-1
      its(:map)           { should == "Metal\xC3\xB3polis" }
    end
    context "with older version replays" do
      subject { SC2Refinery.load("spec/fixtures/1v1-game5-old-version.sc2replay") }

      its(:first_player)  { should == "WolfMan"          }
      its(:second_player) { should == "Boom"             }
      its(:map)           { should == "Abyss"            }
    end
  end
end

