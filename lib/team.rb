class Team
  attr_reader :name, :played, :wons, :losts, :drawns, :points

  def initialize(name:, played: 0, wons: 0, losts: 0, drawns: 0, points: 0)
    @name   = name
    @played = played
    @wons   = wons
    @losts  = losts
    @drawns = drawns
    @points = points
  end

  def win!
    self.played += 1
    self.wons   += 1
    self.points += League::WIN_POINTS
  end

  def lost!
    self.played += 1
    self.losts  += 1
  end

  def drawn!
    self.played += 1
    self.drawns += 1
    self.points += League::DRAWN_POINTS
  end

  private

  attr_writer :played, :wons, :losts, :drawns, :points
end