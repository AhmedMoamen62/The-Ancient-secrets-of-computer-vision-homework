X1 = imread('figs/theta.png');
##[X3,map3]=imread('qt_hw/editable_dog.jpg');
##[X4,map4]=imread('data/dog.jpg');
imshow(X1)
##subplot(2,2,3), imshow(X3,map3)
##subplot(2,2,4), imshow(X4,map4)
function btn_down (obj, evt)
  cp = get (gca, 'CurrentPoint');
  x = round (cp(1, 1));
  y = round (cp(1, 2));
  img = get (findobj (gca, "type", "image"), "cdata");
  img_v = NA;
  if (x > 0 && y > 0 && x <= columns (img) && y <= rows (img))
    img_v = squeeze (img(y, x, :));
  endif

  if (numel (img_v) == 3) # rgb image
    title(gca, sprintf ("(%i, %i) = r(%i), g(%i), b(%i)", x, y, img_v(1), img_v(2), img_v(3)));
  elseif (numel (img_v) == 1) # gray image
    title(gca, sprintf ("(%i, %i) = %i", x, y, img_v));
  endif
endfunction

set (gcf, 'WindowButtonDownFcn', @btn_down);
