
//show_debug_message(self.speed);
var shipSpeed = speed;

var wake = instance_create(x+80,y+100,obj_wake);
with(wake){
  depth=-1;
  image_index=irandom(5);
  image_angle = other.direction;
  image_alpha=0.5
  image_yscale=0.01;
  image_xscale= shipSpeed;
}


