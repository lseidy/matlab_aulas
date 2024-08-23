function new_img = pratica1(img_name, x, y, interpol_sel)
  img = imread(img_name);
  [height,width] = size(img)
  new_img = zeros(ceil(height*x), ceil(width*y));
  [height_new,width_new] = size(new_img)

  height_counter = 0;
  width_counter = 1;
  factor_size_x = x;
  factor_size_y = y;

  if (interpol_sel == 1)
    for i=1:ceil(height*x)
      width_counter =0;
      for j=1:ceil(width*y)
        if (rem(i,x) == 0 && j==1)
          new_img(i,j) = img(i/x,j);
        elseif (rem(i,x) == 0 && j>1)
          if(rem(j,y) == 0)
            new_img(i,j) = img(i/x,j/y);
          else
            new_img(i,j) = new_img(i,j-1);
          endif
        elseif(rem(i,x)>0 && j==1)
          if (factor_size_x == x)
            height_counter += 1;
            factor_size_x = 1 ;
          endif
          factor_size_x += 1;
          new_img(i,j) = img(height_counter,1);

        elseif(rem(i,x)>0 && j>1)
          if(rem(j,y) == 0)
            new_img(i,j) = img(height_counter,j/y);
          else
            new_img(i,j) = new_img(i,j-1);
          endif
        endif
      endfor
    endfor
  elseif(interpol_sel == 2)

    for i = 1:ceil(height *x)
        for j = 1:ceil(width*y)
            original_x = (i - 1) / x + 1;
            original_y = (j - 1) / y + 1;

            x1 = floor(original_x);
            x2 = min(ceil(original_x), height);
            y1 = floor(original_y);
            y2 = min(ceil(original_y), width);

            dx = original_x - x1;
            dy = original_y - y1;

            new_img(i, j) = (1 - dx) * (1 - dy) * img(x1, y1) + ...
                             dx * (1 - dy) * img(x2, y1) + ...
                             (1 - dx) * dy * img(x1, y2) + ...
                             dx * dy * img(x2, y2);
        endfor
    endfor
end


