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
map(50:80,100:550) = 1;
imagesc(map)

%health 1
map(60:70,110:140) = 2;
imagesc(map)
pause(0.1)
% health 2
map(60:70,160:190) = 2;
imagesc(map)
% health 3
map(60:70,210:240) = 2;
imagesc(map)
% health 4
map(60:70,260:290) = 2;
imagesc(map)
% health 5
map(60:70,310:340) = 3;
imagesc(map)
% health 6
map(60:70,360:390) = 2;
imagesc(map)
% health 7
map(60:70,410:440) = 2;
imagesc(map)
% health 8
map(60:70,460:490) = 2;
imagesc(map)
% health 9
map(60:70,510:540) = 2;
imagesc(map)


end





