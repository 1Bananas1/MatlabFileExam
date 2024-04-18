% BOOT UP
clc
fprintf('Before starting this, please make sure you have the MATLAB Compiler installed. \n')
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
    fprintf('\n \n \n \n <strong>File Fighter</strong> \n Start \n Exit \n \n')
end

