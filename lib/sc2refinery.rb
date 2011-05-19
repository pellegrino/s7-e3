require_relative 'sc2refinery/parsers'
require_relative 'sc2refinery/replay'

class SC2Refinery
  require 'mpq'

  def self.load(file)
    archive = MPQ::Archive.new(file)
    replay_details = Structs::ReplayDetails.read(archive.read_file("replay.details"))
    Replay.new(:first_player  => replay_details.players[0].short_name ,
               :second_player => replay_details.players[1].short_name,
               :map           => replay_details.map_name)
  end
end
