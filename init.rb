# To run this, just execute 'ruby ./init.rb' on your terminal

require './lib/league_score.rb'
require './lib/file_reader.rb'
require './lib/league.rb'
require './lib/match.rb'
require './lib/team.rb'

file = File.open('fixtures/result.txt')

league = FileReader.new(file: file).new_league

LeagueScore.calculate(league)

LeagueScore.show(league)
