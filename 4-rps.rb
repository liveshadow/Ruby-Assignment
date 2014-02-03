class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)

    legalPlays = ["p","r","s"]
    gameHash = Hash[game]
    
    raise WrongNumberOfPlayersError unless game.length == 2
    gameHash.each do |player, play|
    	raise NoSuchStrategyError unless legalPlays.include?(play.downcase)
    end

    if game[0][1] == game[1][1] \
       || (game[0][1] == "p" && game[1][1] == "r") \
       || (game[0][1] == "r" && game[1][1] == "s") \
       || (game[0][1] == "s" && game[1][1] == "p")
          return game[0]
    else
          return game[1]
    end
end

p rps_game_winner([["Jacob", "p"],["Luke","r"]])

def rps_tournament_winner(game)
    if game[0][1].class == String  #We can tell if we are on the lowest level of recursion if 
				   #we index into the array twice and the result is a string
	rps_game_winner(game) 
    else 
	#Since we are assuming a fair tournament, whatever is passed must be a 2 element long array
	#  to first index, so we can recursively split the tournament int small "sub tournaments"
	#  until we hit the smallest possible tournament, a game.
      subT1 = rps_tournament_winner(game[0])
      subT2 = rps_tournament_winner(game[1])
      rps_tournament_winner([subT1, subT2])
    end
end

p rps_tournament_winner([ [["Richard", "P"], ["Lydia", "S"]] , [["Bob", "R"],["Michael","S"]], [["Jacob", "P"], ["Fergie", "S"]] , [["George", "R"],["Mason","S"]] ])


=begin
def rps_game_winner(game)

    raise WrongNumberOfPlayersError unless game.length == 2

    raise NoSuchStrategyError if (game[0][1] + game[1][1]) =~ /[^rps]/i

    # {RR, RS,} RP, {SS, SP,} SR, {PP, PR,} PS 

    # if P1 plays Rock and P2 plays Rock OR Scissors, P1 wins
    if (game[0][1] == "R" && (game[1][1] == "R" || game[1][0] == "S"))
	return game[0][0], game[0][1]
    # if P1 plays Rock and P2 plays Paper, P2 wins
    elsif (game[0][1] == "R" && game[1][1] == "P")
	return game[1][0], game[1][1]
    # if P1 plays Scissors and P2 plays Scissors OR Paper, P1 wins
    elsif (game[0][1] == "S" && (game[1][1] == "S" || game[1][0] == "P"))
	return game[0][0], game[0][1]
    # if P1 plays Scissors and P2 plays Rock, P2 wins
    elsif (game[0][1] == "S" && game[1][1] == "R")
	return game[1][0], game[1][1]
    # if P1 plays Paper and P2 plays Paper OR Rock, P1 wins
    elsif (game[0][1] == "P" && (game[1][1] == "P" || game[1][0] == "R"))
	return game[0][0], game[0][1]
    # if P1 plays Paper and P2 plays Scissors, P2 wins
    elsif (game[0][1] == "P" && game[1][1] == "S")
	return game[1][0], game[1][1]
    end

end

puts rps_game_winner([["Jacob", "R"], ["Richard", "R"]])

=end





