require_relative 'parsers/replay_details'

module SC2Refinery

  class Parser
    require 'mpq'

    def self.parse(replay_file)
      archive = MPQ::Archive.new(replay_file)
      replay_details = Structs::ReplayDetails.read(archive.read_file("replay.details"))
      Replay.new(
                 :first_player  => replay_details.players[0].short_name ,
                 :second_player => replay_details.players[1].short_name,
                 :map           => replay_details.map_name
                 )
    end
  end
end
