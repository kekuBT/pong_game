function game_map = drawScore(game_map, player1score, player2score, scoreID)

    % Convert player scores to digits for iteration
    player1digits = num2str(player1score) - '0';
    player2digits = num2str(player2score) - '0';

    % Draw Player 1 score
    for i = 1:length(player1digits)
        game_map(12, 10 + i - 1) = scoreID(player1digits(i) + 1);
    end

    % Draw Player 2 score
    for i = 1:length(player2digits)
        game_map(12, 25 + i - 1) = scoreID(player2digits(i) + 1);
    end
end
