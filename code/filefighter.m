% variables
startGame = 0;
map = 0;
map = zeros(1080,1920);
name = 0;
scale = 0;
background = [113, 105, 103] / 255;
healthBarOutline = [194, 177, 173] / 255;
healthBar = [234, 84, 48] / 255;
scaleColor = [104, 95, 93] / 255;
white = [255, 255, 255] / 255;
black = [0, 0, 0] / 255;
customColorMap = [background; healthBarOutline; scaleColor; healthBar; white; black];
colormap(customColorMap);
map = zeros(1080,1920);
imagesc(map)
gameState = 0;
tutorial =1;
endGame = 0;
currentKeyPress = [];
selectionMode = 1;% 1 for cursor  0 for keyboard
scale = 0.5;
showInventory=false;
turn=0;
cardNumber = 0;
cardSelected = 0;
mouseClicked = 0;
currentCardCount = 0;
gameTurnStatus = 0;
newCardType = 0;
%
% scale = 0.1;
% OffsetX = 400;
% OffsetY = 200;
% initialYStart = 1+ OffsetY;
% initialYEnd = (scale * 1080) + initialYStart;
% initialXStart = 1+ OffsetX;
% initialXEnd = (scale * 1920) + initialXStart;
% posCardYOffset = 0;
% scaleLength = 1920 * scale;
% scaleWidth = 1080 * scale;
% map(initialYStart:initialYEnd,initialXStart:initialXEnd) = 2;
% imagesc(map)




% BOOT UP
clc
fprintf('Before starting this, please make sure you have MATLAB Compiler and getKey installed. \n')
pause(3)
currentAddons = matlab.addons.installedAddons;
disp(currentAddons)
continueBoot = 0;
BootUpAddonConfirm = 0;
pause(rand())
while ((BootUpAddonConfirm ~= 3) && (BootUpAddonConfirm ~= 1)) %% && represents an AND OR statement
    BootUpAddonConfirm = menu("Do you have the addon enabled?","Yes","No","Quit");
    if (BootUpAddonConfirm == 1)
        clc
        continueBoot = 1;
    end
    if (BootUpAddonConfirm == 2)
        clc
        fprintf("Please use the Add-Ons bar found under the home ribbon and locate MATLAB Compiler and hit install. \n Once installed, please run the program again. \n")
        pause(5)
        clc
        BootUpAddonConfirm = 3;
    end
    if (BootUpAddonConfirm == 3)
        clc
        fprintf("Closing Program...\n")
        pause(rand() + 1)
        clc
    end
end
if continueBoot == 1
    clc
    pause(rand())
fprintf('\n \n \n \n <strong>File Fighter</strong> \n 1. Start \n 2. Exit \n \n')
startPrompt = 'Please type 1 or 2 to continue: ';
userInput = input(startPrompt, 's'); % 's' specifies that the input should be treated as a string

% Check the user input and perform actions based on the input
if strcmp(userInput, '1')
    clc
    disp('Starting File Fighter...')
    pause(.1)
    startGame = 1;
    clc
elseif strcmp(userInput, '2')
    disp('Exiting File Fighter...')
    clc
    return
else
    clc
    disp('Invalid input. Please type 1 or 2 to continue.')
    pause(1);

    % Add code to handle invalid input
end
end


%START DA GAME
if startGame == 1
fprintf('Welcome to file fighter...\n \n<strong>Warning</strong>\nAll claims in this game are purely for the game and will not actually occur.\n\n\n\n')
pause(4)
clc
scale = 5;
% Prompt the user to enter their name
name = input('Please enter your name: ', 's');
clc
fprintf('\n\n\n\n Welcome <strong>%s...</strong> \n\n',name)
pause(2)
clc
map = zeros(1080,1920);
imagesc(map)
fprintf('Please dock the image to your matlab.\n')
pause(3)

imagesc(map)


% INITIALIZE BOARD
map(315:685,30:80) = 1;
%health 1
map(325:355,40:70) = 2;
imagesc(map)
pause(0.1)
% health 2
map(365:395,40:70) = 2;
imagesc(map)
% health 3
map(405:435,40:70) = 2;
imagesc(map)
% health 4
map(445:475,40:70) = 2;
imagesc(map)
% health 5
map(485:515,40:70) = 3;
imagesc(map)
% health 6
map(525:555,40:70) = 2;
imagesc(map)
% health 7
map(565:595,40:70) = 2;
imagesc(map)
% health 8
map(605:635,40:70) = 2;
imagesc(map)
% health 9
map(645:675,40:70) = 2;
imagesc(map)


% BOARD

%Row 1
map(40:240,360:560) = 2;
map(40:240,660:860) = 2;
map(40:240,960:1160) = 2;
map(40:240,1260:1460) = 2;

%Row 2
map(290:490,360:560) = 2;
map(290:490,660:860) = 2;
map(290:490,960:1160) = 2;
map(290:490,1260:1460) = 2;

%Row 3
map(540:740,360:560) = 2;
map(540:740,660:860) = 2;
map(540:740,960:1160) = 2;
map(540:740,1260:1460) = 2;
map(560:720,1580:1740) = 1;

%Row 4
map(790:990,360:560) = 2;
map(790:990,660:860) = 2;
map(790:990,960:1160) = 2;
map(790:990,1260:1460) = 2;

%icons
%map(50:100,1720:1770) = 6; %left
map(50:100,1820:1870) = 6; %right
map(55:95,1725:1730) = 5;

gameHeader = '\n<strong>File Fighter</strong>\n\n';
imagesc(map)
gameState = map;
pause(2)
clc
fprintf('\n<strong>File Fighter</strong>\n\nWelcome to File Fighter... \n\n\n<strong><Narrator></strong> Please, grab a blank card on the right.\n\n')
[x,y,button] = ginput(1);

cursorModeActive = false;
clc
if y >= 560 & y <= 720 & x >= 1580 & x <= 1740 & button == 1 & gameTurnStatus == 0
        clc
        fprintf('\n<strong>File Fighter</strong>\n\nPress the icon in the top right of your screen to enter keyboard mode\nPress tab to exit keyboard mode.\n')
        fprintf('\nA blank card has been added to your inventory\n')
        gameState = map;
        button = [];
        x = [];
        y = [];
        currentCardCount = currentCardCount +1;
        gameTurnStatus = 1;
        newCardType = 1;
end


while true
    while selectionMode == 1 
        [x, y, button] = ginput(1);
        if y >= 560 & y <= 720 & x >= 1580 & x <= 1740 & button == 1 %pick up card
            clc
            gameState = map;
            button = [];
            x = [];
            y = [];
            newCardType = 1;
            currentCardCount = currentCardCount +1;
            gameTurnStatus = 1;
        end
        if y >= 50 & y <= 100 & x >= 1820 & x <= 1870 & button == 1
            clc
            fprintf('\nKeyboard mode activated\n')
            selectionMode = 0;
            cursorModeActive = false;
        end
        if y >= 50 & y<= 100 & x >= 1720 & x <= 1770 & button == 1
            clc
            fprintf('Exiting Selection Mode')
            false
            button = [];
            x = [];
            y = [];
        end
        if showInventory == true
            if y>=690 & y<=1070 & x>=700 & x<=1120 & button==1
                fprintf('\nCard Selected\n')
                button = [];
                x = [];
                y = [];
                cardSelected = 1;
            end
        end
        if cardSelected == 1
            if y >= 770 & y <= 990 & x >= 360 & x <= 560 & button == 1 & gameTurnStatus == 1 & currentCardCount == 1 & newCardType == 1
                currentCardSelected = map(690:1070,700:1120);
                region_to_shrink = map(690:1080, 700:1120);
                target_size = size(region_to_shrink) ./ 2;
                shrunk_region = imresize(region_to_shrink, target_size);
                shrunk_region_resized = imresize(shrunk_region, [200, 200]);

                map=gameState;
                map(790:989, 360:559) = shrunk_region_resized;


                imagesc(map)
                gameTurnStatus = 2;
                fprintf('\nCard Placed\n')
                cardSelected = 0;
                button = [];
                x = [];
                y = [];
                gameTurnStatus = 2;
                

            end
        end
        [x, y, button] = ginput(1);



    while selectionMode == 0
        if ~cursorModeActive
            fprintf('Keyboard mode active\n');
            cursorModeActive = true;
        end

        currentKeyPress = getkey('non-ascii');
        if ismember('w', currentKeyPress)
            if showInventory ~= true
                gameState = map;
            end
            map(690:1070, 700:1120) = 5;    % card outline
            map(700:1080, 710:1110) = 1;    %make card
            map(690:700, 700:710) = 4;      % identifier
            map(710:760,720:730) = 5;       % make 0
            map(710:715,720:760)  = 5;
            map(755:760,720:760)  = 5;
            map(710:760,750:760) = 5;       % end 0
            map(710:760,1050:1060) = 5;
            imagesc(map);
            if tutorial == 1
                clc
                fprintf('\n<strong>File Fighter</strong>\n\n\n')
                fprintf('As you can see, a card has been added to your inventory.\nYou can find its attacking number in the top left and its health in the top right.\nGo ahead and place the card in the first row on your side.\n')
                pause(1)
                tutorial = 0;
            end
            showInventory=true;
            currentKeyPress = [];
        end
        if ismember('s', currentKeyPress)
            if showInventory == true
                map = gameState;
                tutorial = 0;
                imagesc(map);
                currentKeyPress = [];
            end
        end
        if ismember('tab', currentKeyPress)
            fprintf('Cursor mode activated\n');
            currentKeyPress = [];
            selectionMode = 1;
            cursorModeActive = false;
            break;
        end
        if ismember('esc', currentKeyPress)
            currentKeyPress = [];
            selectionMode = 1;
            cursorModeActive = false;
            break;
        end


    end
    end
    while gameTurnStatus == 2
        fprintf('End of Turn')
        gameTurnStatus = 0;
    end

end






end








