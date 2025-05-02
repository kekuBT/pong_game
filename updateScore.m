function [player1score,player2score, ballRow, ballCol, rowDelta, colDelta, scored] = updateScore(game_map, player1score, player2score, ballRow, ballCol, rowDelta, colDelta)

     scored = false;

     % Check if ball off field on either side if so increment player score
     if ballCol < 1
         player2score = player2score + 1;
         scored = true;
     elseif ballCol > floor(size(game_map, 2))
         player1score = player1score + 1;
         scored = true;
     end

     % If scored reset ball and set it random direction
     if scored
        ballRow = floor(size(game_map, 1)/2); 
        ballCol = floor(size(game_map, 2)/2);
        pause(0.2) % Delay before restarting

        ballDir = [-1, 1];
        rowDelta = ballDir(randi(2));
        colDelta = ballDir(randi(2));

     end

end