clc
squirrelCard = struct('ID', 1, 'name', 'Squirrel', 'health', 1, 'attack', 0, 'cost', 0);
stoatCard = struct('ID', 2, 'name', 'Stout', 'health', 1, 'attack', 1, 'cost', 1);
wolfCard = struct('ID', 3, 'name', 'Wolf', 'health', 1, 'attack', 3, 'cost', 2);
grizzlyCard = struct('ID', 4, 'name', 'Grizzly', 'health', 1, 'attack', 4, 'cost', 3);
urayuliCard = struct('ID', 5, 'name', 'Urayuli', 'health', 1, 'attack', 7, 'cost', 7);
riversnapperCard = struct('ID', 6, 'name', 'River Stoat', 'health',6,'attack',1,'cost',2);
cardArray={squirrelCard,stoatCard,wolfCard,grizzlyCard,urayuliCard,riversnapperCard};
scale=6;
drawnCardIndex=[];
drawnCardID=0;
drawnCard=[];
currentCardMaster=0;
currentCardDefendingMaster=[];
currentCard= [];
currentCardDefending = 0;
numCardsToDraw = 3;
playerInventory = struct('cards',[]);
i=0;
drawnCardID=0;
blood = 0;
drawnCard.Cost = [];
map=zeros(3,4);
j = 0; % dummy variable for seeing and identifying ID on affected cards

fprintf('Welcome to Inscryption...\n')
pause(0.5)


for i = 1:numCardsToDraw
    randomCardIndex = randi(8); % Generate a random index from 1 to 4

    if randomCardIndex == 1
        randomCard = stoatCard;
    elseif randomCardIndex == 2
        randomCard = wolfCard;
    elseif randomCardIndex == 3
        randomCard = wolfCard;
    elseif randomCardIndex == 4
        randomCard = riversnapperCard;
    elseif randomCardIndex == 5
        randomCard = riversnapperCard;
    elseif randomCardIndex == 6
        randomCard = stoatCard;
    elseif randomCardIndex == 7
        randomCard = urayuliCard;
    else
        randomCard = grizzlyCard;
    end
    % Add the randomly drawn card to the player's inventory
    playerInventory.cards = [playerInventory.cards, randomCard];
end


% Add a squirrel card to the player's inventory
playerInventory.cards = [playerInventory.cards, squirrelCard];


randomComputerCardIndex = randi(8); % Generate a random index from 1 to 4

if randomComputerCardIndex == 1
    randomComputerCard = stoatCard;
elseif randomComputerCardIndex == 2
    randomComputerCard = wolfCard;
elseif randomComputerCardIndex == 3
    randomComputerCard = wolfCard;
elseif randomComputerCardIndex == 4
    randomComputerCard = riversnapperCard;
elseif randomComputerCardIndex == 5
    randomComputerCard = riversnapperCard;
elseif randomComputerCardIndex == 6
    randomComputerCard = stoatCard;
elseif randomComputerCardIndex == 7
    randomComputerCard = urayuliCard;
else
    randomComputerCard = grizzlyCard;
end
map(1,randi(4)) = (randomComputerCard.ID);




gameOver = false;
playerTurn = true;
while ~gameOver
    if playerTurn
        if isempty(playerInventory.cards)
            disp('No more cards in the player inventory. Turn ended.');
            playerTurn = false;
            continue;
        end
        % Display the current game board
        fprintf('\nCurrent Game Board\n')
        fprintf('Scale: %.f \n',scale)
        disp(map);
        % Prompt the player to choose a card (ID 2-5) or a squirrel (ID 1) to draw
        disp('Choose a card to select: ');
        for i = 1:length(playerInventory.cards)
            disp([num2str(i) ' - ' playerInventory.cards(i).name]); % Display the index and name of each card
        end

        selectedCardIndex = input('Enter the index of the card you want to select or end turn by typing 0, type 9 for help: ');
        if selectedCardIndex == 9
            clc
            helpIndex = input('<strong>Card Info</strong> \n1 - Squirrel \n2 - Stoat \n3 - Wolf\n4 - Grizzly\n5 - Urayuli\n6 - River Snapper\n<strong>7 - Back</strong>\nPlease enter a number below to learn more about the card.');
            if helpIndex == 7
                clc
                continue
            else
                disp(cardArray{[helpIndex]})
                decisionMenu = input('1 - Return to Game: \n');
                if decisionMenu == 1
                    clc
                    continue
                else
                    clc
                    continue
                end
            end

        elseif selectedCardIndex == 0
            playerTurn = false;
            continue
        elseif selectedCardIndex >= 1 && selectedCardIndex <= length(playerInventory.cards)
            drawnCard = playerInventory.cards(selectedCardIndex);
            disp(['You selected: ' drawnCard.name]);
        end
        if drawnCardID == 1
            clc
            fprintf('\nCurrent Game Board\n')
            disp(map);
            disp('You selected your Squirrel.');
        else
            clc
            fprintf('\nCurrent Game Board\n')
            disp(map);
            disp(['You selected ' drawnCard.name '.']);
            if drawnCard.cost > blood
                if nnz(map(3,:)) + blood >= drawnCard.cost
                    fprintf('\nPlease sacrifice %.f cards \n', drawnCard.cost)
                    fprintf('\nCurrent Game Board\n')
                    disp(map);
                    disp('Enter the column of the card you want to sacrifice (1-4):');
                    disp(map);
                    sacrificeColumn = input('');
                    if map(3, sacrificeColumn) ~= 0
                        disp(['Sacrificing the card in column ' num2str(sacrificeColumn) '...']);
                        % Implement sacrificing the selected card
                        blood = blood + 1; % Gain 1 blood after sacrificing
                        map(3, sacrificeColumn) = 0; % Remove the card from the map
                    else
                        disp('No card to sacrifice in the selected column.');
                    end
                else
                    fprintf('\nYou do not have enough cards on the board to sacrifice.\n')
                end
            else
                fprintf('Current Blood: ')
                disp(blood)
                disp('Do you want to place (P) the card, sacrifice (S) a card, or end turn (E)?');
                decision = input('', 's');
                if decision == 'P' || decision == 'p'
                    disp('Enter the column where you want to place the card (1-4):');
                    column = input('');
                    map(3, column) = drawnCard.ID;
                    blood = blood - drawnCard.cost(); % Corrected the cost function call
                    clc
                    disp(['Card "' drawnCard.name '" placed successfully on the map.']);
                    % Remove the placed card from the player's inventory
                    playerInventory.cards(selectedCardIndex) = [];
                end
            end
        end
    end
    if ~playerTurn
        clc
        fprintf('End of Turn\nStarting Computer turn.\n')
        fprintf('Scale: %.f \n',scale)
        disp(map)
        for i = 1:4
            if map(3,i) ~= 0 % player attack
                if map(2,i) == 0
                    currentCard = map(3,i);
                    currentCardMaster = cardArray{[currentCard]};
                    scale = scale + currentCardMaster.attack;
                else
                    currentCard = map(3,i);
                    currentCardMaster = cardArray{[currentCard]};
                    currentCardDefending = map(2,i);
                    currentCardDefendingMaster = cardArray{[currentCardDefending]};
                    currentCardDefendingMaster.health = currentCardDefendingMaster.health - currentCardMaster.attack;
                    if currentCardDefendingMaster.health <= 0
                        map(2,i) = 0;
                    end
                end
            end
        end
        for i = 1:4 % computer card move down if on top row
            if map(1,i) ~= 0 && map(2,i) == 0
                map(2,i) = map(1,i);
                map(1,i) = 0;
            end
        end
        for i = 1:4
            if map(3,i) ==0 % check to see if bottom row empty
                if map(2,i) ~=0 % if there is, is there a card above it to be attacked by
                    currentCard = map(2,i);
                    currentCardMaster = cardArray{[currentCard]};
                    scale = scale - currentCardMaster.attack;
                end
            elseif map(3,i) ~= 0
                if map(2,i) ~= 0
                    currentCard = map(2,i);
                    currentCardMaster = cardArray{[currentCard]};
                    currentCardDefending = map(3,i);
                    currentCardDefendingMaster = cardArray{[currentCardDefending]};
                    currentCardDefendingMaster.health = currentCardDefendingMaster.health - currentCardMaster.attack;
                    if currentCardDefendingMaster.health <= 0
                        map(3,i)=0;
                    end
                end
            end
            currentCard = [];
            currentCardID = [];
            currentCardMaster = [];
            currentCardDefending = [];
            currentCardDefendingMaster = [];
        end

        randomCardIndex = randi(8); % Generate a random index from 1 to 4

        if randomCardIndex == 1
            randomCard = stoatCard;
        elseif randomCardIndex == 2
            randomCard = wolfCard;
        elseif randomCardIndex == 3
            randomCard = wolfCard;
        elseif randomCardIndex == 4
            randomCard = riversnapperCard;
        elseif randomCardIndex == 5
            randomCard = riversnapperCard;
        elseif randomCardIndex == 6
            randomCard = stoatCard;
        elseif randomCardIndex == 7
            randomCard = urayuliCard;
        else
            randomCard = grizzlyCard;
        end
        playerInventory.cards = [playerInventory.cards, randomCard,squirrelCard];
        randomComputerCardIndex = randi(8); % Generate a random index from 1 to 4

        if randomComputerCardIndex == 1
            randomComputerCard = stoatCard;
        elseif randomComputerCardIndex == 2
            randomComputerCard = wolfCard;
        elseif randomComputerCardIndex == 3
            randomComputerCard = wolfCard;
        elseif randomComputerCardIndex == 4
            randomComputerCard = riversnapperCard;
        elseif randomComputerCardIndex == 5
            randomComputerCard = riversnapperCard;
        elseif randomComputerCardIndex == 6
            randomComputerCard = stoatCard;
        elseif randomComputerCardIndex == 7
            randomComputerCard = urayuliCard;
        else
            randomComputerCard = grizzlyCard;
        end
        map(1,randi(4)) = (randomComputerCard.ID);
        fprintf('Scale: %.f \n',scale)
        if scale >= 11
            fprintf('\nYou win\n')
            gameOver = true;
        elseif scale <= 0
            fprintf('\nYou lost\n')
            gameOver = true;
        else
            pause(1)
            clc
            playerTurn=true;
        end




    end
end

