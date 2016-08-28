
var waterLevel = 25;
var viewX = floor(global.currentShipX / global.viewWidth)*global.viewWidth;//round to get teh current viewport
var viewY = floor(global.currentShipY / global.viewHeight)*global.viewHeight;
var worldX = global.currentShipX/global.viewWidth;
var worldY = global.currentShipY/global.viewHeight;
var buffer = global.edgeBuffer;
var tc = global.viewWidth*global.viewHeight;
     var viewDist = sqrt(power(worldX,2) + power(worldY,2) );    
    show_debug_message("VIEW " + string(viewDist));
random_set_seed((worldX*1000000) + worldY)
global.mpGrid = mp_grid_create(0,0, global.viewWidth, global.viewHeight,global.tileSize, global.tileSize);
var og =0
var shipCount=0;
var shipMax = ceil(viewDist/7);
for (var xx = viewX+1; xx < viewX + global.viewWidth -1; xx++) {
  for (var yy = viewY+1; yy < viewY + global.viewHeight -1; yy++) {
    var localX = xx-viewX;
    var localY = yy-viewY;
    var distX = abs(localX - global.viewWidth/2);
    var distY = abs(localY - global.viewHeight/2);
    //var dist = sqrt(distX*distX + distY*distY);
    var dist = max(distX, distY)
    var maxWidth = global.viewWidth *0.5 - 2;
    var delta = dist - maxWidth;
    var grad = max(0,50 - (dist * dist));
    og=max(og,grad)  
    //CREATE ISLANDS
    var h =  grad * simplex_octave2(xx, yy, global.mapHash, global.mapGrad, 0, 1, 8, 0.4, 0.1);
    if (h < waterLevel){ 
      h = 0
    } else {
      h = 1;
    }
  
    ds_grid_set(global.mapData, xx - viewX, yy - viewY, h); 

     //CREATE SHIPS
    var val = 100*(irandom(tc)/tc);
    //show_debug_message(val);
    if(val<viewDist && h=0 && shipCount<shipMax){
      shipCount++;
      ds_grid_set(global.enemyData, localX, localY, "ship"); 
    } else {
      ds_grid_set(global.enemyData, localX, localY, ""); 
    }
  }
}
show_debug_message(og) 
