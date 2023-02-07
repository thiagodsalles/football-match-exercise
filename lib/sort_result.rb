module SortResult
  def self.desc(teams)
    teams.sort_by { |k, v| v[:points] }.reverse
  end
end
