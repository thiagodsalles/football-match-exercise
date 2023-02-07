class Match
  attr_reader :home_team, :home_goals, :visit_team, :visit_goals

  def initialize(home_team:, home_goals:, visit_team:, visit_goals:)
    @home_team   = home_team
    @home_goals  = home_goals
    @visit_team  = visit_team
    @visit_goals = visit_goals
  end

  def home_team_victory?
    home_goals > visit_goals
  end

  def visit_team_victory?
    home_goals < visit_goals
  end

  def home_team_victory!
    home_team.win!
    visit_team.lost!
  end

  def visit_team_victory!
    visit_team.win!
    home_team.lost!
  end

  def drawn!
    visit_team.drawn!
    home_team.drawn!
  end
end