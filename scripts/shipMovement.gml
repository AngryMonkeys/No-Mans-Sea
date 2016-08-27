  
speed = max(speed - 0.01,0);


var outside = false;
if(x>room_width){
  outside=true; 
  global.currentShipX+=global.viewWidth;
  x=-sprite_width;
}
if(x<0-sprite_width){
  global.currentShipX-=global.viewWidth;
  outside=true;
  x=room_width;
}
if(y<0-sprite_height){
  global.currentShipY+=global.viewHeight;
  outside=true;
  y=room_height;
}
if(y>room_height){
  global.currentShipY-=global.viewHeight;
  outside=true;
  y=-sprite_height;
}

if(outside){
  show_debug_message(global.currentShipX)
  doRender();
}
