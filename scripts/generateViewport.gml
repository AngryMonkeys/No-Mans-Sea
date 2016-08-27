
var waterLevel = 65;
var viewX = floor(global.currentShipX / global.viewWidth)*global.viewWidth;//round to get teh current viewport
var viewY = floor(global.currentShipY / global.viewHeight)*global.viewHeight;
var buffer = global.edgeBuffer;

for (var xx = viewX-buffer; xx < global.viewWidth + viewX + buffer; xx++) {
  for (var yy = viewY-buffer; yy < global.viewHeight + viewY + buffer; yy++) {
    var h = simplex_octave2(xx, yy, global.mapHash, global.mapGrad, 0, 100, 8, 0.4, 0.1);
    if (h < waterLevel){ 
      h = 0
    } else {
     h = 1;
    }
    ds_grid_set(global.mapData, xx - viewX+buffer, yy - viewY+buffer, h); 
  }
}
