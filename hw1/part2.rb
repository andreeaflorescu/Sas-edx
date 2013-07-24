class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  return rps_game_winner([m1, m2])
end

# a rock-paper-scissors game is a list, where the elements
# are themselves 2-element lists that encode a player's 
# name and a player's selected move
# e.g. game = [ ["Armando", "P"], ["Dave", "S"] ] => Dave would win since S > P
def rps_game_winner(game)

	values = ["r", "p", "s"]
	if game.length != 2
		raise WrongNumberOfPlayersError
	end
	play = [game[0][1].downcase, game[1][1].downcase]
	if !(values.include?(play[0])) || !(values.include?(play[1]))
		raise NoSuchStrategyError
	end
	winning_plays = [["r","s"], ["s", "p"], ["p", "r"]]
	if (play[0] == play[1] || winning_plays.include?(play))
		return game[0]
	else 
		return game[1]
	end
end

# a rock-paper-scissors tournament to be an array of games in which each player
# always plays the same move. A rock-paper-scissors tournament is encoded as
# a bracketed array of games
# e.g. :
#[
#   [
#        [ ["Armando", "P"], ["Dave", "S"] ],
#        [ ["Richard", "R"],  ["Michael", "S"] ],
#    ],
#    [
#        [ ["Allen", "S"], ["Omer", "P"] ],
#        [ ["David E.", "R"], ["Richard X.", "P"] ]
#    ]
#]

def rps_tournament_winner(tournament)
	tournament = tournament.flatten
	if tournament.length == 2
		return tournament
	end
	winner = rps_result([tournament[0], tournament[1]], [tournament[2], tournament[3]])
	tournament = tournament.drop 4
	tournament = tournament + winner
	rps_tournament_winner tournament
end
