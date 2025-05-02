function [game_map, rows, cols, barID, ballID, wallID, backgroundID, scoreID, barHeight, leftBarCol, rightBarCol, topLeftBar, topRightBar, ballRow, ballCol, rowDelta, colDelta, ballDir, player1score, player2score] = initialVar()
    
    % Fill the grid with ID = 1 (Blank) background (row, column)
    game_map = ones(25, 35);

    rows = size(game_map, 1);
    cols = size(game_map, 2);

    % -------- Sprite ID ----------
    backgroundID = 1; % Blank tile
    barID = 111; % Sprite ID for bar
    ballID = 775; % Sprite ID for ball
    wallID = 501; % Sprite ID for wall
    scoreID = 948:957; % Number ID for scores from 0-9
    
    % -------- Bar Setup ------------
    barHeight = 3; % The bar is 3 tile high
    leftBarCol = 2; % Column of the left bar
    rightBarCol = cols - 1; % Column of the left bar

    topLeftBar = floor(rows/2) - floor(barHeight/2); % Starting row of the left bar
    topRightBar = floor(size(game_map, 1)/2) - floor(barHeight/2); % Starting row of the right bar
    
    % -------- Ball Setup ----------
    % Intial ball postion
    ballRow = floor(rows/2); 
    ballCol = floor(cols/2);
    
    % Initial ball directon
    ballDir = [-1, 1];
    rowDelta = ballDir(randi(2)); % Random up/Down
    colDelta = ballDir(randi(2)); % Random left/right
    
    % -------- Score Setup ---------
    % Player scored
    player1score = 0;
    player2score = 0;
    
    
    
    % -------- Game map setup --------
    
    % Bars/Paddles
    game_map(topLeftBar:topLeftBar + barHeight -1, leftBarCol) = barID; % Place left bar
    game_map(topRightBar:topRightBar + barHeight -1, rightBarCol) = barID; % Place right bar
    
    % Ball
    game_map(ballRow, ballCol) = ballID;
    
    % Walls
    game_map(1, :) = wallID; % Top wall
    game_map(end, :) = wallID; % Bottom wall

end
