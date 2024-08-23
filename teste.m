function new_img = teste(img_name, interpol, x ,y)
  img = imread(img_name);
  [height,width] = size(img)
  new_img = zeros(ceil(height*x), ceil(width*y));

  line_factor = height/ceil(height*x);
  collumn_factor = width/ceil(width*y);

  if (interpol == 1)
    for i=1:ceil(height*x)
      for j=1:ceil(width*y)

          x_pos = (j-0.5) * collumn_factor + 0.5;
          y_pos = (i-0.5) * line_factor + 0.5;
          x_new = round(x_pos);
          y_new = round(y_new);


          x_new = max(1, min(width, x_new));
          y_new = max(1, min(height, y_new));

          new_img(i, j) = imagem_original(y_new, x_new);
      endfor
    endfor
  endif
end
