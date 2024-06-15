% Game parameters
no_landmark_types = 3; % how many types of landmark will appear
no_true_landmark_types = 1; % how many types of landmark have coins
no_landmarks_per_type = 3; % how many landmarks of the same type will appear
no_attempts = 5*no_true_landmark_types*no_landmarks_per_type; % how many attempts the player has
% We suggest setting no_attempts to equal the number of coins there are,
% which the default setting ensures (since there are 5 coins per landmark)
generate_random_pattern = true; % selects whether random coin patterns are used
% If set to false, coins will always appear in a 'plus' shape for some
% types of landmark and a 'cross' shape for others

% If you're confident in how the code works, you could try changing the
% grid size (8x8, 10x10 and 12x12 grid graphics are provided) or how the
% treasure is generated. We leave the implementation up to you!

% Set up background
axes('Units', 'normalized', 'Position', [0 0 1 1])
background = imread('resources/desert_island_background.jpg');
image([-525, 1525], [-270, 1290], background);

hold on
grid off
axis equal
axis off

[grid_10_10, grid_10_10_map, grid_10_10_alpha] = imread('resources/grid_10_10.png');
image([-10, 1010], [-10, 1010], grid_10_10, 'AlphaData', grid_10_10_alpha)

% Load graphics
[anchor, anchor_map, anchor_alpha] = imread('resources/anchor.png'); % ID: 1
[barrel, barrel_map, barrel_alpha] = imread('resources/barrel.png'); % ID: 2
[bush, bush_map, bush_alpha] = imread('resources/bush.png'); % ID: 3
[palm_tree, palm_tree_map, palm_tree_alpha] = imread('resources/palm_tree.png'); % ID: 4
[rock, rock_map, rock_alpha] = imread('resources/rock.png'); % ID: 5
[shovel, shovel_map, shovel_alpha] = imread('resources/shovel.png'); % ID: 6
[coin, coin_map, coin_alpha] = imread('resources/coin.png');
[pirate_boy, pirate_boy_map, pirate_boy_alpha] = imread('resources/pirate_boy.png');
pirate_boy = flip(pirate_boy, 2);
pirate_boy_alpha = flip(pirate_boy_alpha, 2);
[pirate_girl, pirate_girl_map, pirate_girl_alpha] = imread('resources/pirate_girl.png');
[whale_tail, whale_tail_map, whale_tail_alpha] = imread('resources/whale_tail.png');
[pirate_ship, pirate_ship_map, pirate_ship_alpha] = imread('resources/pirate_ship.png');
[shadow, shadow_map, shadow_alpha] = imread('resources/shadow.png');

% Add decorations to background
image(-318, 640, imresize(shadow, 1), 'AlphaData', imresize(shadow_alpha, 1)*0.3)
image(-380, 100, imresize(pirate_boy, 0.3), 'AlphaData', imresize(pirate_boy_alpha, 0.3))
image(1046, 527, imresize(shadow, 1), 'AlphaData', imresize(shadow_alpha, 1)*0.3)
image(1017, -10, imresize(pirate_girl,0.3), 'AlphaData', imresize(pirate_girl_alpha, 0.3))
image(-535, 820, imresize(whale_tail,1), 'AlphaData', imresize(whale_tail_alpha, 1))
image(1040, 960, imresize(shadow, 2.15), 'AlphaData', imresize(shadow_alpha, 2.15)*0.3)
image(1025, 640, imresize(pirate_ship,0.9), 'AlphaData', imresize(pirate_ship_alpha, 0.9))

ID_list = [1, 2, 3, 4, 5, 6]; % list of IDs for all landmark types

% create list of landmarks (subset of ID_list)
landmark_list = ID_list;
for i=1:(numel(ID_list)-no_landmark_types)
    idx = randi(numel(landmark_list));
    landmark_list(idx) = [];
end

% create list of true landmarks (subset of landmark_list)
true_landmark_list = landmark_list;
for i=1:(numel(landmark_list)-no_true_landmark_types)
    idx = randi(numel(true_landmark_list));
    true_landmark_list(idx) = [];
end

available_landmark_locations = zeros(10, 10);
available_landmark_locations(2:9,2:9) = 1; % don't let landmarks spawn on edges

treasure = zeros(10, 10);

% If random coin patterns are used, generate the random pattern
a = [1 1 1 1 0 0 0 0];
a_rand = a(randperm(length(a)));
random_pattern = [a_rand(1:4) 1 a_rand(5:8)];

for ID=1:6
    if ismember(ID,landmark_list)
        % randomly generate new landmark location from available spots
        for i = 1:no_landmarks_per_type
            is_valid = 0;
            it = 0;
            it_max = 1000;
            while is_valid == 0 && it < it_max
                i_y = randi([2,9]);
                i_x = randi([2,9]);
                is_valid = available_landmark_locations(i_y,i_x);
                it = it + 1;
            end
            % stop future landmarks from spawning adjacent to this one
            available_landmark_locations(i_y-1,i_x-1) = 0;
            available_landmark_locations(i_y,i_x-1) = 0;
            available_landmark_locations(i_y-1,i_x) = 0;
            available_landmark_locations(i_y-1,i_x+1) = 0;
            available_landmark_locations(i_y,i_x) = 0;
            available_landmark_locations(i_y+1,i_x-1) = 0;
            available_landmark_locations(i_y+1,i_x) = 0;
            available_landmark_locations(i_y,i_x+1) = 0;
            available_landmark_locations(i_y+1,i_x+1) = 0;
            if ismember(ID,true_landmark_list)
                % assign treasure around landmark
                if generate_random_pattern
                    treasure = add_treasure_random(treasure,ID,i_y,i_x, random_pattern);
                else
                    treasure = add_treasure(treasure,ID,i_y,i_x);
                end
          
            end
            % plot corresonding image for landmark ID
            if ID == 1
                image([(i_x - 1 )*100, (i_x)*100], [(i_y - 1)*100, (i_y)*100], anchor, 'AlphaData', anchor_alpha)
            elseif ID == 2
                image([(i_x - 1 )*100, (i_x)*100], [(i_y - 1)*100, (i_y)*100], barrel, 'AlphaData', barrel_alpha)
            elseif ID == 3
                image([(i_x - 1 )*100, (i_x)*100], [(i_y - 1)*100, (i_y)*100], bush, 'AlphaData', bush_alpha)
            elseif ID == 4
                image([(i_x - 1 )*100, (i_x)*100], [(i_y - 1)*100, (i_y)*100], palm_tree, 'AlphaData', palm_tree_alpha)
            elseif ID == 5
                image([(i_x - 1 )*100, (i_x)*100], [(i_y - 1)*100, (i_y)*100], rock, 'AlphaData', rock_alpha)
            elseif ID == 6
                image([(i_x - 1 )*100, (i_x)*100], [(i_y - 1)*100, (i_y)*100], shovel, 'AlphaData', shovel_alpha)
            end
        end
    end
end

treasure;

% Initialize score
score = 0;

% Score text
score_text = text(825, -150, 'text');
score_text.String = "Score: " + score;
score_text.FontSize = 18;
score_text.FontUnits = "normalized";
score_text.FontName = "Papyrus";
score_text.FontWeight = "bold";
score_text.Color = 'k';
score_text.BackgroundColor = 'white';
score_text.EdgeColor = 'k';
score_text.LineWidth = 2;

% Turns remaining text
turns_remaining_text = text(-225, -150, 'text');
turns_remaining_text.String = "Turns Remaining: " + no_attempts;
turns_remaining_text.FontSize = 18;
turns_remaining_text.FontUnits = "normalized";
turns_remaining_text.FontName = "Papyrus";
turns_remaining_text.FontWeight = "bold";
turns_remaining_text.Color = 'k';
turns_remaining_text.BackgroundColor = 'white';
turns_remaining_text.EdgeColor = 'k';
turns_remaining_text.LineWidth = 2;

% Column labels text
column_labels_text = text(25, 1040, 'A B C D E F G H I J');
column_labels_text.FontSize = 16.8;
column_labels_text.FontUnits = "normalized";
column_labels_text.FontWeight = "bold";
column_labels_text.FontName = "Monospaced";
column_labels_text.Color = 'k';

% Row labels text
S = '9876543210';
row_labels = cell(1, numel(S));
for i = 1:numel(S)
  row_labels{i} = S(i);
end
row_labels_text = text(-60, 500, row_labels);
row_labels_text.FontSize = 15.2;
row_labels_text.FontUnits = "normalized";
row_labels_text.FontWeight = "bold";
row_labels_text.FontName = "Monospaced";
row_labels_text.Color = 'k';

% Play the game
for i = 1:no_attempts
    turn_done = 0;
    it = 0;
    it_max = 1000;
    % note: only allows an unsearched tile to be selected with each attempt
    while turn_done == 0 && it < it_max
        [xco, yco] = ginput(1);
    
        grid_loc_x = floor(xco / 100);
        grid_loc_y = floor(yco / 100);
        
        grid_square_x = grid_loc_x * 100;
        grid_square_y = grid_loc_y * 100;
        
        square_xs = [grid_square_x, grid_square_x + 100, grid_square_x + 100, grid_square_x];
        square_ys = [grid_square_y, grid_square_y, grid_square_y + 100, grid_square_y + 100];
        
        if grid_loc_x >= 0 && grid_loc_x <= 9 && grid_loc_y >= 0 && grid_loc_y <= 9 
            if treasure(grid_loc_y + 1, grid_loc_x + 1) >= 1
                score = score + treasure(grid_loc_y + 1, grid_loc_x + 1);
                fill(square_xs,square_ys,'yellow','FaceAlpha',0.3)
                if treasure(grid_loc_y + 1, grid_loc_x + 1) >= 2
                    % Plots two coins if more than one coin is buried in the selected tile
                    image([(grid_loc_x)*100 - 5, (grid_loc_x+1)*100 - 5], [(grid_loc_y)*100 - 5, (grid_loc_y+1)*100 - 5], coin, 'AlphaData', coin_alpha*0.5)
                    image([(grid_loc_x)*100 + 5, (grid_loc_x+1)*100 + 5], [(grid_loc_y)*100 + 5, (grid_loc_y+1)*100 + 5], coin, 'AlphaData', coin_alpha*0.5)
                else
                    image([(grid_loc_x)*100, (grid_loc_x+1)*100], [(grid_loc_y)*100, (grid_loc_y+1)*100], coin, 'AlphaData', coin_alpha*0.5)
                end
                treasure(grid_loc_y + 1, grid_loc_x + 1) = -1;
                sprintf('Current Score: %d', score)
                score_text.String = "Score: " + score;
                turn_done = 1; 
            
            elseif treasure(grid_loc_y + 1, grid_loc_x + 1) == 0
                fill(square_xs,square_ys,'black','FaceAlpha',0.3)
                treasure(grid_loc_y + 1, grid_loc_x + 1) = -1;
                sprintf('Current Score: %d', score)
                turn_done = 1;
            end
        end
    end
    turns_remaining = no_attempts-i;
    turns_remaining_text.String = "Turns Remaining: " + turns_remaining;
    if turns_remaining <= 5
        turns_remaining_text.Color = 'r';
    end
end