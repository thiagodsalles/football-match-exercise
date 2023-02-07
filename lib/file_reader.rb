class FileReader
  def initialize(file:)
    @file   = file
    @league = League.new
  end

  def new_league
    file.readlines.map do |line|
      match_data = line.split(' - ')

      home_team_name  = team_name(match_data[0])
      visit_team_name = team_name(match_data[1])

      home_team  = league.find_or_insert_team(home_team_name)
      visit_team = league.find_or_insert_team(visit_team_name)

      league.matches << Match.new(
        home_team:   home_team,
        home_goals:  team_goals(match_data[0]),
        visit_team:  visit_team,
        visit_goals: team_goals(match_data[1])
      )
    end

    league
  end

  private

  attr_reader :file, :league

  def team_name(team) = team.split(' ')[0..-2].join(' ')

  def team_goals(team) = team.split(' ')[-1]
end
