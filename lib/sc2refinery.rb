require_relative 'sc2refinery/parsers'
require_relative 'sc2refinery/replay'
require 'mpq'

module SC2Refinery
  extend self

  def load(file)
    archive        = MPQ::Archive.new(File.new(file))
    replay_details = Structs::ReplayDetails.read(archive.read_file("replay.details"))
    Replay.new(:first_player  => replay_details.players[0].short_name ,
               :second_player => replay_details.players[1].short_name,
               :map           => replay_details.map_name)
  end
end
