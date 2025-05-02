## Pong Game - Final MATLAB Group Project

## Introduction

This is a classic retro style Pong game recreated in MATLAB using Simple 
Game Engine. It has simple functionalities including choice between 
mutliplayer mode or playing againist smartAI, difficulty options and score 
limit options. The goal is to reach the selected score limit before your 
opponent and it have fun doing it

## User Manual

## Getting Started
Step 1: Open `main.m` in MATLAB.
Step 2: Run `main.m` script.
Step 3: Have fun!

### Menu Options:
- Game Mode: Choose between Signleplayer or Multiplayer.
- Level: Choose smartAI level (Only in Singleplayer).
- Score limit: Choose score points required to win.

### How to play

- **Singleplayer Controls:**
  - W = Move Up
  - S = Move Down

- **Multiplayer Controls:**
  - Player 1: W / S
  - Player 2: Arrow Keys ↑ / ↓

- **ESC**
  - Quit the game anytime

### Features
- Menu options game mode
- Difficulty settings: Casual or Tryhard
- Score limit options (5–25)
- Score display using sprite IDs
- Function-based structure for clarity
- Well documented for code updates

        ---

### Requirements for Succesful Code Run
- MATLAB (Online or Desktop)
- Simple Game Engine (`simpleGameEngine.m` provided or pre-installed)

## Program Description For Developers

### Files Included

- 'main.m' - Main game loop and menu options
- 'intialVar.m' - Initializes game variables, IDs and game map
- 'moveLeftBar.m' - Takes care of player 1(left) bar movement
- 'smartAIBar.m' - Takes care of smartAI bar
- 'updateBall.m' - Ball movement and collision logic
- 'updateScore.m' - Scoring system and ball reset
- 'drawScore.m' - Draws score on field
- 'simpleGameEngine.m' - Handles sprite rendering, key inputs, game drid and more
- 'retro_pack.png' - Sprite sheet used in the game

### Key Variables Used:
- backgroundID - Sprite ID used to draw blank background tiles
- ballCol - Current column position of ball
- ballDir - Random assignments of direction of ball
- ballID - Sprite ID used to draw ball
- ballRow - Current row position of ball
- barHeight - Height of bars/paddles (3 rows)
- barID - Sprite ID used to draw bars/paddles
- colDelta - Direction of horizontal ball movement
- cols - Total number of columns
- framerate - Speed of game refresh loop
- game_map - Matrix holding updated map
- guideDisp - Stores user's choice for guide menu
- guideMsg - Stores text for guide menu
- guideOptions - Buttons for guide menu
- key - Stores last key pressed
- leftBarCol - Column indexes for left bar/paddle
- levelChoice - Stores user's level choice
- levelMsg - Stores text for level menu
- levelOptions - Buttons for levels menu
- modeChoice - Stores user's game mode choice
- modeMsg - Stores text for guide menu
- modeOptions - Buttons for game mode menu
- nextCol - Predicted ball's next columns
- nextRow - Predicted ball's next row
- player1digits - Converts player 1 score to digits
- player2digits - Converts player 2 score to digits
- player1Score - Current score for player 1
- player2Score - Current score for player 2
- pong_scene - SGE object used for rendering
- rightBarCol - Column indexes for right bar/paddle
- rowDelta - Direction of horizontal ball movement
- rows - Total number of rows
- scoreChoice - Stores user's score limit choice
- scored - Boolean check for scored ball
- scoreID - Sprite ID used to draw scores
- scoreLimit - Stores score limit choice
- scoreMsg - Stores text for score limit menu
- scoreOptions - Buttons for game mode menu
- tempCol - Simulated future ball's column
- tempRow - Simulated future ball's row
- topLeftBar - Row indexes for top tile of left bar/paddle
- topRightBar - Row indexes for top tile of right bar/paddle
- wallID - Sprite ID used to draw walls

### Simple Game Engine Commands Used:
- drawScene() - Renders the figure
- getappdata() - Saves user key input
- isgraphics() - Checks if figure is open
- scene.my_figure.KeyPressFcn = @() - Assigns a key press function to keyboard input
- setappdata() - Stores or clears the last key pressed
- simpleGameEngine() - Initializes the SGE object

## Final Algorithm Pseudocode

1. Initialize game varibles and map
2. Pop up game menu options
3. If "Quit" is selected then exit
4. Start game loop
    - Get key input
    - Move bar/paddles
    - Update ball and take care of collision
    - Check for score
        - If scored: update score and reset ball/paddles
        - If score limit reached: show winner and end screen
    - Draw updated game map
    - pause to control framerate for consistency
5. Loop until game is won or "ESC" key is pressed

## Brief Discussions

Throught the development of this game, we tested the game many many times.
When we were running those tests we verified that bar/paddle movement, 
bar/wall collision, score tracking, and smartAI behaviour were running 
correctly. One of the problems we ran into was ball passing through 
bar/paddles too quickly which we got fix by adjusting position checks. We 
also had to have too many attempts into succesfully quitting menu options 
on each menu page which after many trial we got succeded. The biggest 
obstacle we ran into is being able code smartAI bar/paddle, that took us 
more time than intended. Overall, our program's complexity and logics grew 
with  the addition of levels menu, and modular structure. By separating 
necessary  actions into functions helped us keep the code clean and clear.

## Conclusion

This project allowed us to apply our in class lectures and also learn more
on those topics deeper, such as logic design, loops, inputs, and real-time
interactions using SGE. Alongside our lecture this project helped us manage
multiple file program and use MATLAB's figure rendering with sprites. The 
final code of the program is stable and responsive, feels fun and nostalgic 
to play as well. If we had more time we could improve this program by adding
visual win screen, power ups, and more menu options.
