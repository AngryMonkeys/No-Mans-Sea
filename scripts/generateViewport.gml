
var waterLevel = 25;
var viewX = floor(global.currentShipX / global.viewWidth)*global.viewWidth;//round to get teh current viewport
var viewY = floor(global.currentShipY / global.viewHeight)*global.viewHeight;
var worldX = floor(global.currentShipX/global.viewWidth);
var worldY = floor(global.currentShipY/global.viewHeight);
var buffer = global.edgeBuffer;
var tc = global.viewWidth*global.viewHeight;
var viewDist = sqrt(power(worldX,2) + power(worldY,2) );    
    show_debug_message("VIEW " + string(viewDist));
    
var shade = max(0,255-viewDist);
background_blend[0] = make_colour_rgb(shade,shade,shade);

ds_grid_clear(global.enemyData,0);

var og =0
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

   var p =  simplex_octave2(xx, yy, global.enemyHash, global.enemyGrad, 0, 1, 8, 0.4, 0.1);
    ds_grid_set(global.enemyData, xx-viewX, yy-viewY,p);    
  }
}
var sd = ds_grid_get_mean(global.enemyData,0,0,global.viewWidth, global.viewHeight);
show_debug_message("SD  " + string(sd));

if(sd>0.31){
  var shipMax = ceil(viewDist/5);
  
  var shipCount=floor(sd*(shipMax));
    //CREATE SHIPS
  ds_grid_clear(global.enemyData,0);
  var ok=false;
  while(!ok || shipCount<shipMax){
      ok=false;
      var xs = irandom(global.viewWidth-4)+2;
      var ys = irandom(global.viewHeight-4)+2
      if(ds_grid_get(global.mapData, xs, ys)==0 && ds_grid_get(global.enemyData, xs, ys)!="ship" ){
        shipCount++;
        ok=true;
        var key =  string(worldX) + "-" + string(worldY) + "-" + string(shipCount) +"-"
        var maxHealth = viewDist*20;
        var ehealth = ds_map_find_value(global.enemyHistory,key + "health");
        if (is_undefined(ehealth)){
           ehealth = maxHealth;
           ds_map_add(global.enemyHistory, key + "health", ehealth );
        }
        if(ehealth>0){
          ds_grid_set(global.enemyData, xs, ys, "ship"); 
           var ship = instance_create((xs) * global.tileSize, (ys) * global.tileSize, obj_enemy);
          with(ship) {
            ship.speed=2;
            ship.hp = ehealth;
            ship.maxHealth= maxHealth;
            ship.key = key;
          }
        }      
     } 
  }
} else {
  //try for a port!
  var done=false;
  for(var  xx=0; xx < global.viewWidth; xx++){
    for(var yy =0; yy < global.viewHeight; yy++){
       var tileType = ds_grid_get(global.mapData,xx,yy);
       if(tileType=1 && !done){
        //check up and down for land, and left and right for water
          if(ds_grid_get(global.mapData,xx,yy-1)==1 && ds_grid_get(global.mapData,xx,yy+1)==1){
            var offset=0;
            var flip=-1;
            if(ds_grid_get(global.mapData,xx+1,yy)==0){
              done=true;
              offset=1;
              flip=1;
            }
            if(ds_grid_get(global.mapData,xx-1,yy)==0){
              done=true;
            }             
            if(done){
              var key = string(worldX) + "-" + string(worldY);
              var obj = ds_map_find_value(global.portHistory,key);
              if (is_undefined(obj)){
                 if(viewDist mod 2 = 1 ){
                  obj="upgrade";
                 } else {
                  obj="heart"
                 }
                 ds_map_add(global.portHistory, key, obj );
              }
              var port = instance_create((xx+offset) * global.tileSize, (yy) * global.tileSize, obj_port);
              with(port) {
                depth=-10
                image_xscale=flip;
                powerup = obj;
                port.key = key;
              }
              var p;
              if(obj = "heart"){
                p=obj_heart;
              } else if (obj="upgrade"){
                p=obj_upgrade;
              } else {
                p=obj_soldout;
              }
              var pup = instance_create(port.x, port.y+10, p);
              with(pup){
                depth= -100;
                image_speed=0.3;
                if(offset){
                  x+=12;
                } else {
                  x-=48
                }
              }
            }
          }
       }
    }
  }

}
