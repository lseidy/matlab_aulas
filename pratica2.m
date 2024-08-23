function img = pratica2(img_name)
  img = imread(img_name);

  figure;
  imhist(img);

  %valores de minimo e maximo são atribuidos
  min_value = min(min(img));
  max_value = max(max(img));

  %os valores sao puxados para a origem 0 dos valores
  new_img = img(:,:) - 97;

  %os plots lado a lado dos histogramas sao feitos
  figure;
  subplot(1,3,1);
  imhist(img);
  subplot(1,3,2);
  imhist(new_img);

  % o fator de multiplicação para aumento é calculado
  factor = 255/ (max_value-min_value);
  new_img = new_img(:,:)*factor;

  subplot(1,3,3);
  imhist(new_img);
  print("histogramas.png", "-dpng", "histogramas");

  %por fim comparamos as imagens antes e depois
  figure;
  subplot(1,2,1);
  imshow(img);
  subplot(1, 2, 2);
  imshow(new_img);
  print("imagens_pratica2.png", "-dpng", "imagens_pratica2");

end

