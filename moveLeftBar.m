function [topLeftBar, game_map] = moveLeftBar(key, rows, topLeftBar, leftBarCol, barHeight, game_map, backgroundID, barID, upArrow, downArrow)
    
    % clear previous bar position
    game_map(topLeftBar:topLeftBar + barHeight -1, leftBarCol) = backgroundID;

    % Move bar up between the walls
    if topLeftBar > 2 && strcmp(key, upArrow)
        topLeftBar = topLeftBar - 1;
    % Move bar down between the walls
    elseif (topLeftBar + (barHeight - 1)) < (rows - 1) && strcmp(key, downArrow)
        topLeftBar = topLeftBar + 1;
    end

    % Redraw bar at new position
    game_map(topLeftBar:topLeftBar + barHeight - 1, leftBarCol) = barID; % Place bar

end
