var player = instance_find(obj_player,0);
if(player==noone){
  player = instance_create(10000,10000,obj_landTile);
}
var xoffset = 0;
var yoffset = 0;
with(player){
  xoffset = lengthdir_x(other.xadj,direction);
  yoffset = lengthdir_y(other.yadj,direction);
}
mp_potential_settings(6,2,64, 1)
mp_potential_step_object(player.x+xoffset+(sprite_width/2), player.y+yoffset+(sprite_height/2), 2, obj_landTile);

var enemy = instance_nearest(x,y,obj_enemy);

var dist = distance_to_object(enemy);
shot--;
var si =0;
var ei=1;
if(level>1) ei=2
if(level>2) si=-1;

if(dist<200 && shot<=0){
  shot=40;
  audio_play_sound(snd_canon2,1,false);
  var dir = direction-90;
  var odir = direction+90;
  var xoffset = lengthdir_x(20,direction);
  var yoffset = lengthdir_y(20,direction);
  for(var i=si;i<ei;i++){
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
