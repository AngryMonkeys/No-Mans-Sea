var player = instance_find(obj_player,0);

//add 360 to the direction, so we don't have to worry about wrapping to 0
var target = point_direction(x,y,player.x,player.y);
var current = direction;
if(target-current>180) current+=360;
if(current-target>180) target+=360;
if(target>current){
 // direction+=3;
}
if(target<current){
 // direction-=3;
}
mp_potential_settings(15,5,64, 0)
mp_potential_step_object(player.x, player.y, 1, obj_landTile);

//var buffer = global.edgeBuffer;
//var path = path_add();
//mp_grid_path(global.mpGrid,path,x+buffer,y+buffer,player.x+buffer,player.y+buffer,false);
//path_start(path,3,path_action_stop,0)
