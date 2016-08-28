  
//steer away if heading near land
//     90
//  180    0
//    270

//find nearest instance
var land = instance_nearest(x+(sprite_width/2),y+(sprite_height/2),obj_landTile)
//if it's within X, avoid
var dist = distance_to_object(land)

if(dist< global.tileSize){
  // slow down based on distance
/*  var maxSpeed = (dist/global.tileSize) * global.shipPower;
  if(speed>maxSpeed) speed-=0.5;
  var turnSpeed = global.shipPower - maxSpeed;  
  var xdif = (land.x+(global.tileSize/2)) - (x+(sprite_width/2));
  var ydif = (land.y+(global.tileSize/2)) - (y+(sprite_height/2));
  if(direction<90){
    if(xdif>ydif){
      direction+=turnSpeed;
    }
    else {
      direction-=turnSpeed;
    }
  } else if(direction>=90 && direction<180){
    if(xdif>ydif){
      direction-=turnSpeed;
    }
    else {
      direction+=turnSpeed;
    }
  }  else if(direction>=180 && direction<270){
    if(xdif>ydif){
      direction+=turnSpeed;
    }
    else {
      direction-=turnSpeed;
    }
  }  else if(direction>=270){
    if(xdif>ydif){
      direction-=turnSpeed;
    }
    else {
      direction+=turnSpeed;
    }
  }*/
}

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
global.shipSpeed = speed;

var wake = instance_create(x+80,y+100,obj_wake);
with(wake){
  depth=-1;
  image_index=irandom(5);
  image_angle = other.direction;
  image_alpha=0.5
  image_yscale=0.01;
  image_xscale=global.shipSpeed;
}

if(outside){
  show_debug_message(global.currentShipX)
  doRender();
}

