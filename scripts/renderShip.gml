with(obj_ship){
  instance_destroy();
}

//var localX = (global.currentShipX mod global.viewWidth) * global.tileSize;
//var localY = (global.currentShipY mod global.viewHeight) * global.tileSize;
//if(localX<0) localX = (global.viewWidth * global.tileSize)+localX;
//if(localY<0) localY = (global.viewHeight * global.tileSize)+localY;

var ship = instance_create(global.currentShipX, global.currentShipY, obj_ship);
with(ship) {
  image_yscale = global.tileSize/100;
  image_xscale = global.tileSize/100; //TODO: This is temporary till work work out the scale
      
  depth = -1000;
}
