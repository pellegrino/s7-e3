require 'spec_helper'

require 'mpq'

describe 'exploring around' do


  it "trying to parse other replay" do

    a = MPQ::Archive.new File.new("spec/fixtures/Cavernas Xel'Naga.Sc2replay")
    BinData::trace_reading do
      r = ReplayDetails.read(a.read_file("replay.details"))
      puts r.map_name
      puts r.players[0].short_name
      puts r.players[0].race
      puts r.players[0].unknown6
      puts r.players[1].short_name
      puts r.players[1].race
      puts r.players[1].unknown6
    end
  end
  it "trying to parse replay details" do
    a = MPQ::Archive.new File.new("spec/fixtures/1v1-replay.sc2rep")

    # A Raca dos jogadores esta em algum lugar no unknown  6
#    BinData::trace_reading do
      r = ReplayDetails.read(a.read_file("replay.details"))
      puts r.map_name
      puts r.double_player_count
      puts r.players[0].short_name
      puts r.players[0].race
      puts r.players[0].unknown6
      puts r.players[1].short_name
      puts r.players[1].race
 #   end

    false.should be_true
  end

end
