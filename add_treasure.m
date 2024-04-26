function new_treasure = add_treasure(treasure, ID, i_y, i_x)
%ADD_TREASURE Adds treasure to the treasure grid
new_treasure = treasure;
if ID == 1 || ID == 2 || ID == 3
    new_treasure(i_y, i_x-1) = treasure(i_y, i_x-1) + 1;
    new_treasure(i_y-1, i_x) = treasure(i_y-1, i_x) + 1;
    new_treasure(i_y, i_x) = treasure(i_y, i_x) + 1;
    new_treasure(i_y, i_x+1) = treasure(i_y, i_x+1) + 1;
    new_treasure(i_y+1, i_x) = treasure(i_y+1, i_x) + 1;
elseif ID == 4 || ID == 5 || ID == 6
    new_treasure(i_y-1, i_x-1) = treasure(i_y-1, i_x-1) + 1;
    new_treasure(i_y-1, i_x+1) = treasure(i_y-1, i_x+1) + 1;
    new_treasure(i_y, i_x) = treasure(i_y, i_x) + 1;
    new_treasure(i_y+1, i_x-1) = treasure(i_y+1, i_x-1) + 1;
    new_treasure(i_y+1, i_x+1) = treasure(i_y+1, i_x+1) + 1;
end
end

