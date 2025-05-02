function [topRightBar, game_map] = smartAIBar(rows, cols, topRightBar, rightBarCol, barHeight, game_map, ...
    backgroundID, barID, ballRow, rowDelta, ballCol, levelChoice)

    % Clear old position
    game_map(topRightBar:topRightBar + barHeight - 1, rightBarCol) = backgroundID;

    if levelChoice == 1
        % Casual level
        % 80% chance of reaction
        % Small random offset while tracking ball

        if ballCol > cols / 2 && rand < 0.8
            targetRow = ballRow + rowDelta + randi([-1, 1]);
            barCenter = topRightBar + 1;
            topRightBar = topRightBar + sign(targetRow - barCenter); % Bar movement logic
        end

    elseif levelChoice == 2
        % Tryhard level
        % Predicts ball destination by simulating ball path

        % Predict final row looking few steps forward
        tempRow = ballRow;
        tempCol = ballCol;
        tempRowDelta = rowDelta;

        while tempCol < cols - 2
            tempRow = tempRow + tempRowDelta;
            tempCol = tempCol + 1;
            if tempRow <= 1 || tempRow >= rows
                tempRowDelta = -tempRowDelta;
            end
        end

        targetRow = tempRow;
        barCenter = topRightBar + floor(barHeight / 2);
        topRightBar = topRightBar + sign(targetRow - barCenter); % Bar movement logic
    end

    % Stick position to screen
    topRightBar = max(2, min(topRightBar, rows - barHeight));

    % Redraw bar
    game_map(topRightBar:topRightBar + barHeight - 1, rightBarCol) = barID;
end
