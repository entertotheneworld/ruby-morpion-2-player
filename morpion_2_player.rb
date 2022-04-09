def display
    puts "  #{$board_game[0]}   #{$board_game[1]}   #{$board_game[2]}"
    puts "  #{$board_game[3]}   #{$board_game[4]}   #{$board_game[5]}"
    puts "  #{$board_game[6]}   #{$board_game[7]}   #{$board_game[8]}"
end

def test_winner
    x,y = "X", "O"
    if ($board_game[0] == x && $board_game[1] == x && $board_game[2] == x) || ($board_game[3] == x && $board_game[4] == x && $board_game[5] == x) || ($board_game[6] == x && $board_game[7] == x && $board_game[8] == x) || ($board_game[0] == x && $board_game[3] == x && $board_game[6] == x) || ($board_game[1] == x && $board_game[4] == x && $board_game[7] == x) || ($board_game[2] == x && $board_game[5] == x && $board_game[8] == x) || ($board_game[0] == x && $board_game[4] == x && $board_game[8] == x) || ($board_game[2] == x && $board_game[4] == x && $board_game[6] == x)
        puts "Joueur 1 a gagné ! Félicitation"
        return true
    elsif ($board_game[0] == y && $board_game[1] == y && $board_game[2] == y) || ($board_game[3] == y && $board_game[4] == y && $board_game[5] == y) || ($board_game[6] == y && $board_game[7] == y && $board_game[8] == y) || ($board_game[0] == y && $board_game[3] == y && $board_game[6] == y) || ($board_game[1] == y && $board_game[4] == y && $board_game[7] == y) || ($board_game[2] == y && $board_game[5] == y && $board_game[8] == y) || ($board_game[0] == y && $board_game[4] == y && $board_game[8] == y) || ($board_game[2] == y && $board_game[4] == y && $board_game[6] == y)
        puts "Joueur 2 a gagné ! Félicitation"
        return true
    else 
        return false
    end
end

def test_shot(capture)
    z = "."
    while $board_game[capture - 1] != z
        puts "Mauvaise saisie, recommencez !"
        capture = gets.chomp.to_i
    end
    while capture < 1 || capture > 9
        puts "Mauvaise saisie, recommencez !"
        capture = gets.chomp.to_i
    end
    return capture
end



x,y,z = "X", "O", "."
$board_game= %w[. . . . . . . . .]

players = ["joueur 1", "Joueur 2"]
who_play = players.sample
puts "#{who_play} commence"
display

loop do
    
    if who_play == players[0]
        puts "Saisie joueur 1"
        capture = gets.chomp.to_i
        capture = test_shot(capture)
        $board_game[capture - 1] = x 
        who_play = players[1]
    elsif who_play == players[1]
        puts "Saisie joueur 2"
        capture = gets.chomp.to_i
        capture = test_shot(capture)
        $board_game[capture - 1] = y
        who_play = players[0]
    end
    
    display
 
    break if test_winner == true
            
end