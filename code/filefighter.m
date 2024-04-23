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
customColorMap = [background; healthBarOutline; scaleColor; healthBar];
colormap(customColorMap);
map = zeros(1080,1920);

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

%Row 4
map(790:990,360:560) = 2;
map(790:990,660:860) = 2;
map(790:990,960:1160) = 2;
map(790:990,1260:1460) = 2;

imagesc(map)

pause(2)
clc
fprintf('\n<strong>File Fighter</strong>\n\nWelcome to file fighter...')


end





