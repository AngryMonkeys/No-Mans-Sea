  var xdif = abs((other.x+(global.tileSize/2)) - (x+(sprite_width/2)));
  var ydif = abs((other.y+(global.tileSize/2)) - (y+(sprite_height/2)));
  if(direction<90){
    if(xdif>ydif){
      direction+=90;
    }
    else {
      direction-=90;
    }
  } else if(direction>=90 && direction<180){
    if(xdif>ydif){
      direction-=90;
    }
    else {
      direction+=90;
    }
  }  else if(direction>=180 && direction<270){
    if(xdif>ydif){
      direction+=90;
    }
    else {
      direction-=90;
    }
  }  else if(direction>=270){
    if(xdif>ydif){
      direction-=90;
    }
    else {
      direction+=90;
    }
  }
