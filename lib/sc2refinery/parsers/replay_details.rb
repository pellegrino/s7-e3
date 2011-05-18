# encoding: utf-8
require 'bindata'

module SC2Refinery

  module Structs
    # https://github.com/ascendedguard/sc2replay-csharp/wiki/playerDetailStruct

  end

#  module Parsers
    # https://github.com/ascendedguard/sc2replay-csharp/wiki/Replay.details-Format

 # end
end

class KeyValue < BinData::Record
  uint16be :param_key
  uint8 :first_byte
  uint8 :second_byte , :onlyif => :needed?

  def needed?
    ( first_byte & 0x80 ) > 0
  end

#   def value
#     if second_byte
#       (first_byte + second_byte) / 2
#       first_byte <<= 1

#       # BitConverter.ToInt16(new[] { firstByte, secondByte }, 0);
#       value = BinData::Int16be.new(first_byte + second_byte)
#       value >>= 1

#       value = BinData::Int8be.new( value / 2)
#     else
#       BinData::Int8be.new(first_byte / 2)
#     end
#  end

end

class PlayerDetails < BinData::Record
  endian :big

  uint32 :player_header
  uint8  :name_len
  string :short_name, :read_length => lambda { name_len / 2}
  array :unknown1, :type => :uint8, :initial_length => 3
  key_value :param1
  array :unknown2 , :type => :uint8 , :initial_length => 6
  key_value :param2
  uint16 :unknown3
  stringz :unknown6
  array :unknown4 , :type => :uint8 , :initial_length => 3
  uint8   :double_race_length
  string  :race  , :read_length => lambda { double_race_length / 2 }
  array  :unknown5, :type => :uint8 , :initial_length => 3
  array   :param_list , :type => :key_value , :initial_length => 7
# See Known paramList values for more information.
end


class ReplayDetails <  BinData::Record
  endian :big

  array :unknown_header, :type => :uint8, :initial_length => 6
  uint8 :double_player_count
  array :players , :type => :player_details, :initial_length => lambda { double_player_count / 2}
#  player_details :player, :read_length => lambda{ double_player_count / 2}

  array :unknown1 , :type => :uint8, :initial_length => 2
  uint8 :double_map_name_length
  string :map_name, :read_length => lambda { double_map_name_length / 2 }

  uint16 :unknown2
  uint8 :double_unknown3_length

  string :unknown3, :read_length => lambda { double_unknown3_length / 2 }
  array :unknown4 , :type => :uint8, :initial_length => 3

  uint16 :unknown5
  uint8  :double_minimap_filename_length
  string :minimapFilename , :read_length => lambda { double_minimap_filename_length / 2 }
end
