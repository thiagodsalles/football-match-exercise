class MatchCalculator
  WIN_POINTS   = 3.freeze
  DRAWN_POINTS = 1.freeze

  def self.call(**args) = new(**args).call
  
  def initialize(data:, teams:)
    @data             = data
    @teams            = teams
    @home_team_name   = Serializer.name(data[0])
    @visit_team_name  = Serializer.name(data[1])
    @home_team_goals  = Serializer.goals(data[0])
    @visit_team_goals = Serializer.goals(data[1])
  end

  def call
    set_default_home_team
    set_default_visit_team
    sum_played_match

    if home_team_goals > visit_team_goals
      home_team_wins!
    elsif visit_team_goals > home_team_goals
      visit_team_wins!
    else
      drawn!
    end
  end

  private

  attr_reader :data, :teams, :home_team_name, :visit_team_name, :home_team_goals, :visit_team_goals

  def set_default_home_team
    unless teams[home_team_name]
      teams[home_team_name] = { played: 0, wons: 0, drawns: 0, losts: 0, points: 0 }
    end
  end

  def set_default_visit_team
    unless teams[visit_team_name]
      teams[visit_team_name] = { played: 0, wons: 0, drawns: 0, losts: 0, points: 0 }
    end
  end

  def sum_played_match
    teams[home_team_name][:played]  += 1
    teams[visit_team_name][:played] += 1
  end

  def home_team_wins!
    teams[home_team_name][:wons]   += 1
    teams[home_team_name][:points] += WIN_POINTS
    teams[visit_team_name][:losts] += 1
  end

  def visit_team_wins!
    teams[visit_team_name][:wons]   += 1
    teams[visit_team_name][:points] += WIN_POINTS
    teams[home_team_name][:losts]   += 1
  end

  def drawn!
    teams[home_team_name][:points]  += DRAWN_POINTS
    teams[home_team_name][:drawns]  += 1
    teams[visit_team_name][:points] += DRAWN_POINTS
    teams[visit_team_name][:drawns] += 1
  end
end
