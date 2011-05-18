require 'spec_helper'

require 'mpq'

describe 'exploring around' do


  it "trying to parse replay details" do
    a = MPQ::Archive.new File.new("spec/fixtures/1v1-replay.sc2rep")
#    puts a.read_file("replay.details")


    BinData::trace_reading do
      r = ReplayDetails.read(a.read_file("replay.details"))
      puts r.players[0].short_name
      puts r.players[0].unknown1
      puts r.players[0].param1
      puts r.players[0].race

      puts r.players[1].short_name
      puts r.players[1].race
    end

    false.should be_true
  end

end
