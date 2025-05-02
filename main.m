ssssclc, clear, close all

% -----------------------------------------------------------

% Pong Game
% - Player vs Player and Player vs SmartAI
% - Difficulty selection (Casual or Tryhard)
% - Score limit selection
% - Ball and paddle logic with collision
% - Menu-driven game mode and difficulty selection

% -----------------------------------------------------------


% ------------ Game Setup ---------------

% Initialize the simple game engine with a 16x16 sprite sheet
pong_scene = simpleGameEngine('retro_pack.png', 16, 16, 5, [0,0,0]);

% Force figure to initialize with a blank map
drawScene(pong_scene, ones(1,1));

% Key press tracking, saves the last key pressed
pong_scene.my_figure.KeyPressFcn = @(src, event) setappdata(src, 'lastKey', event.Key);

% Constant Variable & Initial Positions
[game_map, rows, cols, barID, ballID, wallID, backgroundID, scoreID, barHeight, leftBarCol, rightBarCol, topLeftBar, topRightBar, ballRow, ballCol, rowDelta, colDelta, ballDir, player1score, player2score] = initialVar();

framerate = 15; % frames per second

% --------------------- Menu Options ----------------------

% Menu options for Game mode
modeMsg = ["Welcome To Pong!","Select Your Game Mode:"];
modeOptions = ["Multiplayer" "Singleplayer" "Quit"];
modeChoice = menu(modeMsg,modeOptions);

% Quit Option
if modeChoice == 2
    levelMsg = ["Choose Your Opponents Level" "Select Level: "];
    levelOptions = ["Casual" "Tryhard" "Quit"];
    levelChoice = menu(levelMsg, levelOptions);

    if levelChoice == numel(levelOptions)
        close all;
        return;
    end

elseif modeChoice == numel(modeOptions)
    close all;
    disp("Good Bye!")
    return;
end

% Menu options for Score Limit
scoreMsg = ["Select Game Score Limit", "First to: "];
scoreOptions = ["5" "10" "15" "20" "25" "Quit"];
scoreChoice = menu(scoreMsg, scoreOptions);
scoreLimit = str2double(scoreOptions(scoreChoice));

% Quit Option
if scoreChoice == numel(scoreOptions)
    close all;
    disp("Good Bye!")
    return;
end

guideMsg = ["Let's get right to it!" + newline "Singleplayer controls:" "W = Move up, S = Move down" + newline "Multiplayer controls:", "Up Arrow = Move up, Down Arrow = Move down" + newline "ESC = Quit"];
guideOptions = ["Continue" "Quit"];
guideDisp = menu(guideMsg,guideOptions);

% Quit Option
if guideDisp == numel(guideOptions)
    close all;
    disp("Good Bye!")
    return;
end

% -------------------- Game Main Loop ---------------------------

disp('Game started')

while true

    tic; % starts timer

    % Get user keyboard input
    if isgraphics(pong_scene.my_figure)
        key = getappdata(pong_scene.my_figure, 'lastKey');
    else
        key = '';
    end

    % Handle left bar movement (Player 1) with W/S
    [topLeftBar, game_map] = moveLeftBar(key, rows, topLeftBar, leftBarCol, barHeight, game_map, backgroundID, barID, 'w', 's');

    if modeChoice == 1
        % Handle right bar movement (Player 2) with up/down arrow keys
        [topRightBar, game_map] = moveLeftBar(key, rows, topRightBar, rightBarCol, barHeight, game_map, backgroundID, barID, 'uparrow', 'downarrow');        
    elseif modeChoice == 2
        % Handle right bar movement (SmartAI)
        [topRightBar, game_map] = smartAIBar(rows, cols, topRightBar, rightBarCol, barHeight, game_map, ...
    backgroundID, barID, ballRow, rowDelta, ballCol, levelChoice);
        
    end

    setappdata(pong_scene.my_figure, 'lastKey', '');

    % Ball movement and collision
    [ballRow, ballCol, rowDelta, colDelta, game_map] = updateBall(ballRow, ballCol, rowDelta, colDelta, ballID, backgroundID, game_map, topLeftBar, leftBarCol, topRightBar, rightBarCol, barHeight);
    pause(0.1); % Delay after ball movement (Ball speed)

    % Score system
    [player1score,player2score, ballRow, ballCol, rowDelta, colDelta, scored] = updateScore(game_map, player1score, player2score, ballRow, ballCol, rowDelta, colDelta);

    % Check for scoring and reset
    if scored
        game_map(topLeftBar:topLeftBar + barHeight - 1, leftBarCol) = backgroundID;
        game_map(topRightBar:topRightBar + barHeight - 1, rightBarCol) = backgroundID;

        topLeftBar = floor(rows/2) - floor(barHeight/2);
        topRightBar = floor(rows/2) - floor(barHeight/2);

        game_map(topLeftBar:topLeftBar + barHeight -1, leftBarCol) = barID;
        game_map(topRightBar:topRightBar + barHeight - 1, rightBarCol) = barID;

        pause(1);
        if player1score >= scoreLimit
            msg = sprintf("Player 1 won\nFinal Score: %d vs %d", player1score, player2score);
            menu(msg, 'Exit');
            close all;
            break;
        elseif player2score >= scoreLimit
            msg = sprintf("Player 2 won\nFinal Score: %d vs %d", player1score, player2score);
            menu(msg, 'Exit');
            close all;
            break;
        end
        
    end    

    game_map = drawScore(game_map, player1score, player2score, scoreID);

    % Draw updated game map
    if isgraphics(pong_scene.my_figure)
        drawScene(pong_scene, game_map)
    else
        break;
    end

    % Exit game with ESC key
    if strcmp(key, 'escape')
        close all;
        disp("Good Bye!")
        break;
        
    end

    pause(max(0, 1/framerate - toc));
    
end
 