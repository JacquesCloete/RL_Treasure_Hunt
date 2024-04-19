background = imread('background.png');
image([0, 1000], [0, 1000], background);
hold on
grid on
axis square

anchor = imread('anchor.jpg');
anchor_alpha = sum(anchor == 255, 3) ~= 3;

%anchor(:,:, 4) = ones(360, 360);

r = randi([1,10], 2, 5);

treasure = zeros(10, 10);

for i = r
    i_y = i(1);
    i_x = i(2);
    treasure(i_y, i_x) = 1;
    image([(i_x - 1 )*100, (i_x)*100], [(i_y - 1)*100, (i_y)*100], anchor, 'AlphaData', anchor_alpha)
end

treasure;

for i = 1:10
    [xco, yco] = ginput(1);

    grid_loc_x = floor(xco / 100);
    grid_loc_y = floor(yco / 100);
    
    grid_square_x = grid_loc_x * 100;
    grid_square_y = grid_loc_y * 100;
    
    square_xs = [grid_square_x, grid_square_x + 100, grid_square_x + 100, grid_square_x];
    square_ys = [grid_square_y, grid_square_y, grid_square_y + 100, grid_square_y + 100];

    if treasure(grid_loc_y + 1, grid_loc_x + 1) == 1
        fill(square_xs,square_ys,'yellow','FaceAlpha',0.3)
    else
        fill(square_xs,square_ys,'black','FaceAlpha',0.3)
    end
end
