
class TennisGame1
  WINNING_DIFFERENCE = 2
  FORTY              = 3
  SCORE_TEXTS        = %w[Love Fifteen Thirty Forty].freeze

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @points  = { @player1 => 0, @player2 => 0 }
  end

  def won_point(player)
    @points[player] += 1
  end

  def score
    if winning_score?
      winner_desc
    elsif deuce_score?
      deuce_desc
    elsif advantage_score?
      advantage_desc
    elsif equal_score?
      equal_desc
    else
      non_equal_desc
    end
  end

  def winning_score?
    one_high_score? && winning_difference?
  end

  def deuce_score?
    higher_score? && equal_score?
  end

  def advantage_score?
    higher_score? && !equal_score?
  end

  def equal_score?
    @points[@player1] == @points[@player2]
  end

  def one_high_score?
    @points[@player1] > FORTY || @points[@player2] > FORTY
  end

  def higher_score?
    @points[@player1] >= FORTY && @points[@player2] >= FORTY
  end

  def winning_difference?
    (@points[@player1] - @points[@player2]).abs >= WINNING_DIFFERENCE
  end

  def winner_desc
    'Win for ' + winning_player_name
  end

  def advantage_desc
    'Advantage ' + winning_player_name
  end

  def deuce_desc
    'Deuce'
  end

  def equal_desc
    score_desc(@player1) + '-All'
  end

  def non_equal_desc
    score_desc(@player1) + '-' + score_desc(@player2)
  end

  def score_desc(player)
    SCORE_TEXTS[@points[player]]
  end

  def winning_player_name
    @points[@player1] > @points[@player2] ? @player1 : @player2
  end
end

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score
    else
      p2Score
    end
  end

  def score
    result = ''
    if (@p1points == @p2points) && (@p1points < 3)
      result = 'Love' if @p1points == 0
      result = 'Fifteen' if @p1points == 1
      result = 'Thirty' if @p1points == 2
      result += '-All'
    end
    result = 'Deuce' if (@p1points == @p2points) && (@p1points > 2)

    p1res = ''
    p2res = ''
    if (@p1points > 0) && (@p2points == 0)
      p1res = 'Fifteen' if @p1points == 1
      p1res = 'Thirty' if @p1points == 2
      p1res = 'Forty' if @p1points == 3
      p2res = 'Love'
      result = p1res + '-' + p2res
    end
    if (@p2points > 0) && (@p1points == 0)
      p2res = 'Fifteen' if @p2points == 1
      p2res = 'Thirty' if @p2points == 2
      p2res = 'Forty' if @p2points == 3

      p1res = 'Love'
      result = p1res + '-' + p2res
    end

    if (@p1points > @p2points) && (@p1points < 4)
      p1res = 'Thirty' if @p1points == 2
      p1res = 'Forty' if @p1points == 3
      p2res = 'Fifteen' if @p2points == 1
      p2res = 'Thirty' if @p2points == 2
      result = p1res + '-' + p2res
    end
    if (@p2points > @p1points) && (@p2points < 4)
      p2res = 'Thirty' if @p2points == 2
      p2res = 'Forty' if @p2points == 3
      p1res = 'Fifteen' if @p1points == 1
      p1res = 'Thirty' if @p1points == 2
      result = p1res + '-' + p2res
    end
    if (@p1points > @p2points) && (@p2points >= 3)
      result = 'Advantage ' + @player1Name
    end
    if (@p2points > @p1points) && (@p1points >= 3)
      result = 'Advantage ' + @player2Name
    end
    if (@p1points >= 4) && (@p2points >= 0) && ((@p1points - @p2points) >= 2)
      result = 'Win for ' + @player1Name
    end
    if (@p2points >= 4) && (@p1points >= 0) && ((@p2points - @p1points) >= 2)
      result = 'Win for ' + @player2Name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |_i|
      p1Score
    end
  end

  def setp2Score(number)
    (0..number).each do |_i|
      p2Score
    end
  end

  def p1Score
    @p1points += 1
  end

  def p2Score
    @p2points += 1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
      @p1 += 1
    else
      @p2 += 1
    end
  end

  def score
    if ((@p1 < 4) && (@p2 < 4)) && (@p1 + @p2 < 6)
      p = %w[Love Fifteen Thirty Forty]
      s = p[@p1]
      @p1 == @p2 ? s + '-All' : s + '-' + p[@p2]
    else
      if @p1 == @p2
        'Deuce'
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1 - @p2) * (@p1 - @p2) == 1 ? 'Advantage ' + s : 'Win for ' + s
      end
    end
  end
end
