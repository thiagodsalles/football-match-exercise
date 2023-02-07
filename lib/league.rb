class League
  WIN_POINTS   = 3
  DRAWN_POINTS = 1
  
  attr_reader   :teams
  attr_accessor :matches

  def initialize(teams: [], matches: [])
    @teams   = teams
    @matches = matches
  end

  def find_or_insert_team(name)
    team = find_team(name)

    return team if team

    insert_team(name)
  end

  def sort_teams
    teams.sort_by { |team| team.points }.reverse
  end

  private

  attr_writer :teams

  def find_team(name)
    teams.select { |team| team.name == name }.first
  end

  def insert_team(name)
    team = Team.new(name: name)
    
    teams << team
    
    team
  end
end