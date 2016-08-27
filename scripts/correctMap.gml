//if water is surrounded by 3 land tiles, make it land
//if land is surrounded by 3 water tiles, make it water
//repeat until there's none
var buffer = global.edgeBuffer * 2;
var fixed = false;
while(!fixed) {
  fixed = true;
  for(var xx =1; xx < global.gridWidth-1; xx++){
    for(var yy = 1; yy < global.gridHeight-1; yy++){
      var counter = 0;
      var cellType = ds_grid_get(global.mapData, xx, yy);
      if(ds_grid_get(global.mapData, xx - 1, yy    ) != cellType) counter ++ ;
      if(ds_grid_get(global.mapData, xx    , yy - 1) != cellType) counter ++ ;
      if(ds_grid_get(global.mapData, xx + 1, yy    ) != cellType) counter ++ ;
      if(ds_grid_get(global.mapData, xx    , yy + 1) != cellType) counter ++ ;
      if(counter>=3){
       // show_debug_message("FOUND A PROBLEM");
        fixed = false;
        if(cellType==0) ds_grid_set(global.mapData, xx, yy,1);
        if(cellType==1) ds_grid_set(global.mapData, xx, yy,0);
      }      
    }
  }
}
 for(var xx =buffer; xx < global.gridWidth-buffer; xx++){
    for(var yy = buffer; yy < global.gridHeight-buffer; yy++){
       // if this is the first time we're rendering, make sure ship is in water
      if(global.initialiseShip && ds_grid_get(global.mapData, xx, yy)==0 ){
        global.initialiseShip = false;
        global.currentShipX = xx;
        global.currentShipY = yy;
      }
  }
}


