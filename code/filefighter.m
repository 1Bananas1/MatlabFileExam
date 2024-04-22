% variables
startGame = 0;
map = 0;

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
fprintf('Welcome to file fighter...\n \nWarning\nBefore we start, we should mention that all claims in this game are purely for the game and will not actually occur \nDo you understand?\n')
pause(2)
map = zeros(1920,1080);
image(map)
end


jgysdfigkwueghoweriutywers;ogiyserpt9


