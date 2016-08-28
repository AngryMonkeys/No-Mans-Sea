correctMap();
var buffer = global.edgeBuffer;
for(var  xx=0; xx < global.viewWidth+buffer; xx++){
  for(var yy =0; yy < global.viewHeight+buffer; yy++){
    var tileType = ds_grid_get(global.mapData,xx,yy);
    
    if(tileType=0){
      var t = obj_waterTile;
    //  var tile = instance_create((xx-buffer) * global.tileSize, (yy-buffer) * global.tileSize, t);
     } else{
      var t = obj_landTile;     
      var tile = instance_create((xx-buffer) * global.tileSize, (yy-buffer) * global.tileSize, t);
      with(tile) {
        image_yscale = global.tileSize/64;
        image_xscale = global.tileSize/64; //TODO: This is temporary till work work out the scale
        image_index=11;//TODO: set the type of tile in here
        var up = ds_grid_get(global.mapData,xx,yy-1);
        var down = ds_grid_get(global.mapData,xx,yy+1);
        var left = ds_grid_get(global.mapData,xx-1,yy);
        var right = ds_grid_get(global.mapData,xx+1,yy);
        var upleft = ds_grid_get(global.mapData,xx-1,yy-1);
        var downleft = ds_grid_get(global.mapData,xx-1,yy+1);
        var upright = ds_grid_get(global.mapData,xx+1,yy-1);
        var downright = ds_grid_get(global.mapData,xx+1,yy+1);
  
        if(tileType=1){
          //this is a land tile
          if(left && up && right && down){
            image_index=8;
            //inside corners
            if(!downright) {
              image_index=4;
            }
            if(!downleft){
              image_index=6;
            }
            if(!upright){
              image_index=16;
            }
            if(!upleft){
              image_index=18;
            }    
            if(!upleft && !downright){
              image_index=19
            }    
            if(!upright && !downleft){
              image_index=20
            }    
          }
          //straights
          if(left && right && up && !down){
            image_index=14;
          }
          if(left && right && !up && down){
            image_index=17;
          }        
          if(left && !right && up && down){
            image_index=10;
          }
          
          if(!left && right && up && down){
            image_index=12;
          }
          //outside corners
          if(!left && right && !up && down){
            image_index=1;
          }
          if(left && !right && !up && down){
            image_index=3;
          }
          if(!left && right && up && !down){
            image_index=13;
          }
          if(left && !right && up && !down){
            image_index=15;
          }
          
        }     
      }
    }
  }
}

