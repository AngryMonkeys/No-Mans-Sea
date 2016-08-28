var enemy = instance_nearest(x,y,obj_enemy);

if(shot<=0){
shot=40;
  var dir = direction-90;
  var odir = direction+90;
  var xoffset = lengthdir_x(20,direction);
  var yoffset = lengthdir_y(20,direction);
  for(var i=-1;i<2;i++){
    var xpos = x+(sprite_width/2)+ (i*xoffset);
    var ypos = y+(sprite_height/2)+ (i*yoffset);
    var ball = instance_create(xpos,ypos,obj_ball);
    with(ball){
      direction = dir;
      speed=10;
    }
     var ball2 = instance_create(xpos,ypos,obj_ball);
    with(ball2){
      direction = odir;
      speed=10;
    }
  }
}
