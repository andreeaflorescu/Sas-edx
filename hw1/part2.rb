class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)

	values = ["r", "p", "s"]
	if game.length != 2
		raise('WrongNumberOfPlayersError')
	end
	play = [game[0][1].downcase, game[1][1].downcase]
	if !(values.include?(play[0])) || !(values.include?(play[1]))
		raise('NoSuchStrategyError')
	end
	winning_plays = [["r","s"], ["s", "p"], ["p", "r"]]
	if (play[0] == play[1] || winning_plays.include?(play))
		return game[0]
	else 
		return game[1]
	end
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
end
