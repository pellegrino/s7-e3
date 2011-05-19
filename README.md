# SC2Refinery - RMU SESSION 7 EXERCISE 3

SC2 Replays extractor. This version extracts the name of both players,
as well as the map name where the match was played.

## About the MPQ Format

The MPQ Format is an archive used at Blizzard replays. It is composed
of several binaries files. The project https://github.com/nolanw/mpq
is used to open up the archive.

This project, currently, parses the "replay.details" file, extracting
Basic Player and Map information.

## Usage
        replay_file = File.new("spec/fixtures/1v1-game1.sc2replay")
        @replay = SC2Refinery::Parser.parse(replay_file)
        puts @replay.first_player # pellegrino
        puts @replay.second_player # DeusEx
        puts @replay.map # Cavernas Xel'Naga

For more examples of usage, check spec/parser_spec.rb

## General information
This project relies on BinData (http://bindata.rubyforge.org/) to
create its structures used in parsing replay files.
The structures mapped at this project are in lib/sc2refinery/parsers/replay_details.

## Links and documentation
https://github.com/nolanw/mpq

https://github.com/ascendedguard/sc2replay-csharp/wiki/.sc2replay-overview
- from this link i took most of the information about the archive
needed to build this project.
