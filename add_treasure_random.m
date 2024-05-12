function new_treasure = add_treasure_random(treasure, ID, i_y, i_x, random_treasure)
%ADD_TREASURE Adds treasure to the treasure grid
new_treasure = treasure;

for i = 1:9
    if random_treasure(i) == 1
        y = floor((i-1) / 3)-1;
        x = rem(i-1, 3)-1;
        
        new_treasure(i_y + y, i_x + x) = treasure(i_y + y, i_x + x) + 1;
    end
end
end
