function [ballRow, ballCol, rowDelta, colDelta, game_map] = updateBall(ballRow, ballCol, rowDelta, colDelta, ballID, backgroundID, game_map, topLeftBar, leftBarCol, topRightBar, rightBarCol, barHeight)

    % Clear ball from current position
    if game_map(ballRow, ballCol) == ballID
        game_map(ballRow, ballCol) = backgroundID;
    end

    % Predict next position
    nextRow = ballRow + rowDelta;
    nextCol = ballCol + colDelta;

    % Bounce off top/bottom walls
    if nextRow <= 1 || nextRow >= size(game_map, 1)
        rowDelta = -rowDelta;
        nextRow = ballRow + rowDelta; % recalc
    end

    % Bounce on left paddle
    if nextCol == leftBarCol + 1 && nextRow >= topLeftBar && nextRow <= topLeftBar + barHeight - 1
        colDelta = -colDelta;
    end

    % Bounce on right paddle
    if nextCol == rightBarCol - 1 && nextRow >= topRightBar && nextRow <= topRightBar + barHeight - 1
        colDelta = -colDelta;
    end

    % Move ball to next position
    ballRow = nextRow;
    ballCol = nextCol;

    % Keep ball on field
    if ballRow >= 1 && ballRow <= size(game_map, 1) && ...
       ballCol >= 1 && ballCol <= size(game_map, 2)
        game_map(ballRow, ballCol) = ballID;
    end
end
