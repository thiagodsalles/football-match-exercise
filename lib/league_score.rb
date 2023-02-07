module LeagueScore
  def self.calculate(league)
    league.matches.each do |match|
      if match.home_team_victory?
        match.home_team_victory!
      elsif match.visit_team_victory?
        match.visit_team_victory!
      else
        match.drawn!
      end
    end
  end

  def self.show(league)
    sorted_teams = league.sort_teams

    sorted_teams.each do |team|
      puts "#{team.name}, played: #{team.played}, wons: #{team.wons}, losts: #{team.losts}, dranws: #{team.drawns}, points: #{team.points}"
    end
  end
end