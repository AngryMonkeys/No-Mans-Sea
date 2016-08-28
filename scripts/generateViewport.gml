
var waterLevel = 65;
var viewX = floor(global.currentShipX / global.viewWidth)*global.viewWidth;//round to get teh current viewport
var viewY = floor(global.currentShipY / global.viewHeight)*global.viewHeight;
var buffer = global.edgeBuffer;
global.mpGrid = mp_grid_create(0,0, global.viewWidth, global.viewHeight,global.tileSize, global.tileSize);

for (var xx = viewX-buffer; xx < global.viewWidth + viewX + buffer; xx++) {
  for (var yy = viewY-buffer; yy < global.viewHeight + viewY + buffer; yy++) {
    //CREATE ISLANDS
    var h = simplex_octave2(xx, yy, global.mapHash, global.mapGrad, 0, 100, 8, 0.4, 0.1);
    if (h < waterLevel){ 
      h = 0
    } else {
      h = 1;
      mp_grid_add_cell(global.mpGrid ,xx - viewX+buffer,yy - viewY+buffer);
    }
    ds_grid_set(global.mapData, xx - viewX+buffer, yy - viewY+buffer, h); 

     //CREATE SHIPS    
    var s = simplex_octave2(xx, yy, global.enemyHash, global.enemyGrad, 0, 100, 8, 0.4, 0.1);
    if(s>80 && h=0){
      ds_grid_set(global.enemyData, xx - viewX+buffer, yy - viewY+buffer, "ship"); 
    } else {
      ds_grid_set(global.enemyData, xx - viewX+buffer, yy - viewY+buffer, ""); 
    }
  }
}
